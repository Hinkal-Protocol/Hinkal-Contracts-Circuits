// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import {UTXOLib} from "../../../lib/UTXOLib.sol";
import {UTXO} from "../../../types/UTXO.sol";
import {CircomData, StealthAddressStructure, FeeStructure} from "../../../types/CircomData.sol";

import {Transferer} from "../../../Transferer.sol";
import {ExternalActionBaseUpgradeable} from "../../ExternalActionBaseUpgradeable.sol";
import {EmporiumStorage} from "./EmporiumStorage.sol";

import {IHinkalWallet} from "../../../types/IHinkalWallet.sol";
import {IHinkalHelper} from "../../../types/IHinkalHelper.sol";

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";

import {EmporiumStack, EmporiumOperation} from "../EmporiumStack.sol";

contract EmporiumUpgradeable is
    Initializable,
    EmporiumStorage,
    ExternalActionBaseUpgradeable,
    Transferer,
    EIP712Upgradeable
{
    using UTXOLib for UTXO[];

    bytes32 private constant EMPORIUM_OPERATION_TYPEHASH =
        keccak256(
            "EmporiumOperation(address endpoint,bool invokeWallet,uint128 value,bytes callData)"
        );

    bytes32 private constant EMPORIUM_SIGNATURE_TYPEHASH =
        keccak256(
            "EmporiumSignature(uint256 message,EmporiumOperation[] ops,uint256 maxFee,uint256 deadline)EmporiumOperation(address endpoint,bool invokeWallet,uint128 value,bytes callData)"
        );

    bytes32 private constant EMPORIUM_CANCEL_TYPEHASH =
        keccak256("EmporiumCancel(uint256 message)");

    error CallFailed(bytes err);
    error UnauthorizedWalletCall();
    error BalanceChangeShouldBePositive();
    error InvalidSignature();
    error UsedMessage();
    error SignatureExpired();
    error FeeExceedsSignedMax();

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(
        IHinkalHelper _hinkalHelper,
        address[] memory _allowedRecipients,
        address _owner
    ) public initializer {
        __EIP712_init("Emporium", "1.0.0");
        __ExternalActionBase_init(_allowedRecipients); // Initialize parent contract
        EmporiumStorageVars storage $ = _getEmporiumStorage();

        $._hinkalHelper = _hinkalHelper;

        _transferOwnership(_owner);
    }

    function setHinkalHelper(IHinkalHelper _hinkalHelper) external onlyOwner {
        EmporiumStorageVars storage $ = _getEmporiumStorage();
        $._hinkalHelper = _hinkalHelper;
    }

    function runAction(
        CircomData calldata circomData,
        int256[] calldata deltaAmountChanges
    ) external override onlyAllowedRecipient returns (UTXO[] memory) {
        EmporiumStack memory stack = abi.decode(
            circomData.externalActionData.externalActionMetadata,
            (EmporiumStack)
        );

        uint256[] memory balancesBefore = getBalancesForArray(
            circomData.erc20TokenAddresses
        );

        verifyWallet(stack, circomData);

        for (uint256 i = 0; i < stack.ops.length; i++) {
            EmporiumOperation memory op = stack.ops[i];

            bool success;
            bytes memory err;

            // CASE 1: Stateful Interaction
            if (op.invokeWallet && stack.signerAddress != address(0)) {
                (success, err) = IHinkalWallet(stack.signerAddress)
                    .callHinkalWallet(op.endpoint, op.callData, op.value);
            }
            // CASE 2: Stateless Interaction
            else {
                bytes4 selector = bytes4(op.callData);
                if (
                    selector == IHinkalWallet.callHinkalWallet.selector ||
                    selector == IHinkalWallet.doSendToRelay.selector
                ) {
                    revert UnauthorizedWalletCall();
                }

                (success, err) = op.endpoint.call{value: op.value}(op.callData);
            }

            if (!success) {
                revert CallFailed(err);
            }
        }

        payRelayFees(circomData, stack.signerAddress, deltaAmountChanges);

        uint256[] memory balancesAfter = getBalancesForArray(
            circomData.erc20TokenAddresses
        );

        UTXO[] memory utxoSet = new UTXO[](
            circomData.erc20TokenAddresses.length
        );

        uint256 utxoSetLength;

        for (uint256 i = 0; i < circomData.erc20TokenAddresses.length; i++) {
            int256 balanceChange = int256(balancesAfter[i]) -
                int256(balancesBefore[i]);

            if (deltaAmountChanges[i] < 0) {
                balanceChange -= deltaAmountChanges[i];
                // this equation reads: total change of emporium balance = what was moved to emporium (-deltaAmountChange) + how emporium balance changed through tx (balanceChange)
            }

            // the only case when balanceChange can be < 0, when there were some funds on emporium before the call
            if (balanceChange < 0) {
                revert BalanceChangeShouldBePositive();
            }

            UTXO memory utxoOut = handleOut(balanceChange, circomData, i);

            if (utxoOut.amount > 0) {
                utxoSet[utxoSetLength++] = utxoOut;
            }
        }

        if (utxoSetLength < circomData.erc20TokenAddresses.length) {
            utxoSet.skipLast(
                circomData.erc20TokenAddresses.length - utxoSetLength
            );
        }

        return utxoSet;
    }

    function handleOut(
        int256 balanceChange,
        CircomData calldata circomData,
        uint256 i
    ) internal returns (UTXO memory outUtxo) {
        // total change can be less than zero if there was some balance before the call -> that's why we have <=
        if (balanceChange <= 0) {
            return outUtxo;
        }

        transferERC20TokenOrETH(
            circomData.erc20TokenAddresses[i],
            msg.sender,
            uint256(balanceChange)
        );

        outUtxo = UTXO(
            uint256(balanceChange),
            circomData.erc20TokenAddresses[i],
            circomData.stealthAddressStructure,
            circomData.timeStamp
        );
    }

    function sendToRelayFromWallet(
        address relay,
        address signerAddress,
        uint256 relayFee,
        address feeToken
    ) internal {
        if (relayFee > 0) {
            IHinkalWallet(signerAddress).doSendToRelay(
                relay,
                relayFee,
                feeToken
            );
        }
    }

    function payRelayFees(
        CircomData calldata circomData,
        address signerAddress,
        int256[] calldata deltaAmountChanges
    ) internal {
        FeeStructure calldata feeStructure = circomData.feeStructure;

        bool foundToken = false;

        for (uint256 i = 0; i < circomData.erc20TokenAddresses.length; i++) {
            // tokens deposited into Emporium are not charged
            if (deltaAmountChanges[i] >= 0) {
                continue;
            }

            address erc20TokenAddress = circomData.erc20TokenAddresses[i];
            bool isFeeToken = erc20TokenAddress == feeStructure.feeToken;

            if (isFeeToken) {
                foundToken = true;
            }

            uint256 relayFee = 0;
            uint256 flatFee = isFeeToken ? feeStructure.flatFee : 0;

            if (signerAddress == address(0)) {
                uint256 sumAbs = uint256(-deltaAmountChanges[i]);

                EmporiumStorageVars storage $ = _getEmporiumStorage();
                relayFee = $._hinkalHelper.calculateRelayFee(
                    sumAbs,
                    flatFee,
                    feeStructure.variableRate
                );
            } else {
                relayFee = flatFee;
            }

            payRelay(
                circomData.relay,
                signerAddress,
                relayFee,
                erc20TokenAddress
            );
        }

        if (!foundToken && feeStructure.flatFee != 0) {
            require(
                signerAddress != address(0),
                "Gas Token in Emporium is not found"
            );

            payRelay(
                circomData.relay,
                signerAddress,
                feeStructure.flatFee,
                feeStructure.feeToken
            );
        }
    }

    function payRelay(
        address relay,
        address signerAddress,
        uint256 relayFee,
        address erc20TokenAddress
    ) internal {
        if (relay == address(0) || relayFee == 0) {
            return;
        }

        if (signerAddress == address(0)) {
            sendToRelay(relay, relayFee, erc20TokenAddress);
        } else {
            sendToRelayFromWallet(
                relay,
                signerAddress,
                relayFee,
                erc20TokenAddress
            );
        }
    }

    function _hashEmporiumOps(
        EmporiumOperation[] memory ops
    ) private pure returns (bytes32) {
        bytes32[] memory opHashes = new bytes32[](ops.length);
        for (uint256 i = 0; i < ops.length; i++) {
            opHashes[i] = keccak256(
                abi.encode(
                    EMPORIUM_OPERATION_TYPEHASH,
                    ops[i].endpoint,
                    ops[i].invokeWallet,
                    ops[i].value,
                    keccak256(ops[i].callData)
                )
            );
        }
        return keccak256(abi.encodePacked(opHashes));
    }

    function verifyWallet(
        EmporiumStack memory stack,
        CircomData calldata circomData
    ) internal {
        EmporiumStorageVars storage $ = _getEmporiumStorage();

        if ($.usedMessages[circomData.emporiumMessage]) {
            revert UsedMessage();
        }

        $.usedMessages[circomData.emporiumMessage] = true;

        if (stack.signerAddress == address(0)) {
            return;
        }

        bytes32 hashedMessage = _hashTypedDataV4(
            keccak256(
                abi.encode(
                    EMPORIUM_SIGNATURE_TYPEHASH,
                    circomData.emporiumMessage,
                    _hashEmporiumOps(stack.ops),
                    stack.maxFee,
                    stack.deadline
                )
            )
        );

        (address recoveredAddress, ECDSA.RecoverError err) = ECDSA.tryRecover(
            hashedMessage,
            stack.v,
            stack.r,
            stack.s
        );
        bool verified = err == ECDSA.RecoverError.NoError &&
            recoveredAddress == stack.signerAddress;
        if (!verified) {
            revert InvalidSignature();
        }

        if (block.timestamp > stack.deadline) {
            revert SignatureExpired();
        }

        if (circomData.feeStructure.flatFee > stack.maxFee) {
            revert FeeExceedsSignedMax();
        }
    }

    /// @notice Lets a signer burn `emporiumMessage` before it's used, via a fresh signature
    /// recovering to msg.sender (so no one else can cancel it for them).
    function cancelEmporiumMessage(uint256 emporiumMessage, uint8 v, bytes32 r, bytes32 s) external {
        EmporiumStorageVars storage $ = _getEmporiumStorage();

        bytes32 hashedMessage = _hashTypedDataV4(
            keccak256(abi.encode(EMPORIUM_CANCEL_TYPEHASH, emporiumMessage))
        );

        (address recoveredAddress, ECDSA.RecoverError err) = ECDSA.tryRecover(hashedMessage, v, r, s);
        bool verified = err == ECDSA.RecoverError.NoError && recoveredAddress == msg.sender;
        if (!verified) {
            revert InvalidSignature();
        }

        $.usedMessages[emporiumMessage] = true;
    }

    receive() external payable {}
}
