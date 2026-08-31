// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {HinkalBase, IMerkle, Dimensions, CircomData, UTXO, OnChainCommitment} from "./HinkalBase.sol";

import {VerifierFacade} from "./VerifierFacade.sol";
import {IHinkal} from "./types/IHinkal.sol";
import {IExternalActionV2} from "./types/IExternalActionV2.sol";
import {IPreTransactHook, ITransactHook} from "./types/ITransactHook.sol";
import {StealthAddressStructure} from "./types/StealthAddressStructure.sol";
import {TokenWithAmount} from "./types/TokenWithAmount.sol";

///@title Hinkal Contract
///@notice Entrypoint for all Hinkal Transactions.
contract Hinkal is IHinkal, VerifierFacade, HinkalBase {
    constructor(
        IMerkle.MerkleConstructorArgs memory constructorArgs,
        address _hinkalHelper,
        address _hinkalHelperManager
    ) HinkalBase(constructorArgs, _hinkalHelper, _hinkalHelperManager) {}

    function registerExternalAction(
        uint256 externalActionId,
        address externalActionAddress
    ) public onlyRole(DEFAULT_ADMIN_ROLE) {
        externalActionMap[externalActionId] = externalActionAddress;
        emit ExternalActionRegistered(externalActionAddress);
    }

    function transact(
        uint256[2] calldata a,
        uint256[2][2] calldata b,
        uint256[2] calldata c,
        Dimensions calldata dimensions,
        CircomData calldata circomData
    ) public payable nonReentrant {
        {
            uint256[] memory inputForCircom = hinkalHelper.performHinkalChecks(
                circomData,
                dimensions,
                msg.sender
            );

            require(
                verifyProof(
                    a,
                    b,
                    c,
                    inputForCircom,
                    buildVerifierId(
                        dimensions,
                        circomData.externalActionData.externalActionId
                    )
                ),
                "Invalid Proof"
            );
            // Root Hash Validation
            require(
                rootHashExists(
                    circomData.rootHashHinkal,
                    circomData.rootHashHinkalIndex
                ),
                "Hinkal Root Hash is Incorrect"
            );
        }
        hinkalHelper.performSideEffects(circomData);

        {
            if (circomData.hookData.preHookContract != address(0)) {
                IPreTransactHook transactHook = IPreTransactHook(
                    circomData.hookData.preHookContract
                );
                transactHook.preTransact(circomData);
            }

            UTXO[] memory utxoSet;

            uint256[] memory oldBalances = getBalancesForArray(
                circomData.erc20TokenAddresses
            );

            if (circomData.externalActionData.externalActionId == 0) {
                _internalTransact(circomData);
            } else {
                utxoSet = _externalTransact(circomData);
            }

            uint256[] memory newBalances = getBalancesForArray(
                circomData.erc20TokenAddresses
            );

            OnChainCommitment[]
                memory onChainCommitments = new OnChainCommitment[](
                    utxoSet.length
                );
            uint256 onChainCommitmentCounter = 0;
            for (uint64 i; i < circomData.erc20TokenAddresses.length; i++) {
                int256 balanceDif;

                if (circomData.erc20TokenAddresses[i] == address(0)) {
                    balanceDif =
                        int256(newBalances[i]) +
                        int256(msg.value) -
                        int256(oldBalances[i]);
                } else {
                    balanceDif =
                        int256(newBalances[i]) -
                        int256(oldBalances[i]);
                }
                // balance inequality to check that minimum amount of token is received/given
                require(
                    balanceDif >= circomData.slippageValues[i],
                    "slippage param is violated"
                );

                uint256 utxoAmount = 0;
                for (uint j = 0; j < utxoSet.length; j++) {
                    if (
                        utxoSet[j].erc20Address ==
                        circomData.erc20TokenAddresses[i]
                    ) {
                        utxoAmount += utxoSet[j].amount;

                        onChainCommitments[
                            onChainCommitmentCounter
                        ] = createOnchainCommitment(
                            utxoSet[j],
                            circomData.onChainEncryptedOutput
                        );
                        onChainCommitmentCounter++;
                    }
                }

                // balance equation to check: CHANGE IN BALANCE SHOULD EQUAL TO
                // 1) change in off-chain utxos
                // 2) change in on-chain utxos
                require(
                    balanceDif ==
                        (
                            circomData.onChainCreation[i]
                                ? int256(0)
                                : circomData.amountChanges[i]
                        ) +
                            int256(utxoAmount),
                    "Balance Diff Should be equal to sum of onchain and offchain created commitments"
                );
            }

            if (circomData.hookData.postHookContract != address(0)) {
                ITransactHook transactHook = ITransactHook(
                    circomData.hookData.postHookContract
                );
                transactHook.afterTransact(circomData);
            }

            insertNullifiers(
                circomData.inputNullifiers,
                circomData.onChainCreation
            );

            insertCommitments(
                circomData.outCommitments,
                circomData.encryptedOutputs,
                onChainCommitments,
                circomData.onChainCreation
            );
        }
    }

    ///@notice private internal function for transaction
    ///@param circomData circom dara
    function _internalTransact(CircomData calldata circomData) private {
        bool hasPaidToRelay = false;
        for (uint64 i = 0; i < circomData.erc20TokenAddresses.length; i++) {
            int256 deltaAmountChange = _calculateDeltaAmount(circomData, i);

            if (deltaAmountChange > 0) {
                require(
                    circomData.externalActionData.externalAddress == msg.sender,
                    "Deposit should come from the sender"
                );
                transferERC20TokenFromOrCheckETH(
                    circomData.erc20TokenAddresses[i],
                    circomData.externalActionData.externalAddress,
                    address(this),
                    uint256(circomData.amountChanges[i])
                );
            } else {
                uint256 sumAbs = uint256(-deltaAmountChange);
                uint256 relayFee = 0;
                if (circomData.relay != address(0)) {
                    uint256 flatFee = circomData.feeStructure.feeToken ==
                        circomData.erc20TokenAddresses[i]
                        ? circomData.feeStructure.flatFee
                        : 0;

                    require(
                        sumAbs >= flatFee,
                        "Relay Fee is over withdraw amount"
                    );

                    uint256 recipientAmount = ((10000 -
                        circomData.feeStructure.variableRate) *
                        (sumAbs - flatFee)) / 10000;

                    relayFee = sumAbs - recipientAmount;

                    if (relayFee > 0) {
                        transferERC20TokenOrETH(
                            circomData.erc20TokenAddresses[i],
                            circomData.relay,
                            relayFee
                        );
                    }
                    hasPaidToRelay = true;
                }
                if (sumAbs - relayFee > 0) {
                    transferERC20TokenOrETH(
                        circomData.erc20TokenAddresses[i],
                        circomData.externalActionData.externalAddress,
                        sumAbs - relayFee
                    );
                }
            }
        }
        require(
            circomData.relay == address(0) || hasPaidToRelay,
            "relay not paid"
        );
    }

    ///@notice internal function to use Hinkal with external contracts.
    ///@param circomData circom data.
    function _externalTransact(
        CircomData calldata circomData
    ) internal returns (UTXO[] memory) {
        require(
            externalActionMap[circomData.externalActionData.externalActionId] ==
                circomData.externalActionData.externalAddress &&
                circomData.externalActionData.externalAddress != address(0),
            "Unknown externalAddress"
        );

        int256[] memory deltaAmountChanges = new int256[](
            circomData.erc20TokenAddresses.length
        );
        for (uint256 i = 0; i < circomData.erc20TokenAddresses.length; i++) {
            deltaAmountChanges[i] = _calculateDeltaAmount(circomData, i);
            if (deltaAmountChanges[i] < 0) {
                transferERC20TokenOrETH(
                    circomData.erc20TokenAddresses[i],
                    circomData.externalActionData.externalAddress,
                    uint256(-deltaAmountChanges[i])
                );
            }
        }

        return
            IExternalActionV2(circomData.externalActionData.externalAddress)
                .runAction(circomData, deltaAmountChanges);
    }

    function prooflessDeposit(
        address[] calldata erc20Addresses,
        uint256[] calldata amounts,
        StealthAddressStructure[] calldata stealthAddressStructures,
        bytes[] calldata onChainEncryptedOutputs,
        bool createBlockedUtxos,
        string calldata orderId // unused on-chain; off-chain listeners read it from calldata to match this tx to an order
    ) public payable nonReentrant {
        hinkalHelper.performProoflessDepositChecks(
            erc20Addresses,
            amounts,
            stealthAddressStructures,
            onChainEncryptedOutputs
        );

        (
            TokenWithAmount[] memory uniqueTokens,
            uint256 uniqueCount
        ) = _calcTokenChangesForProoflessDeposit(erc20Addresses, amounts);

        _handleTransfersFromProoflessDeposit(uniqueTokens, uniqueCount);

        _createProoflessDepositCommitments(
            erc20Addresses,
            amounts,
            stealthAddressStructures,
            onChainEncryptedOutputs
        );

        if (createBlockedUtxos) {
            markUtxosAsBlocked();
        }
    }

    function _calcTokenChangesForProoflessDeposit(
        address[] calldata erc20Addresses,
        uint256[] calldata amounts
    )
        private
        pure
        returns (TokenWithAmount[] memory uniqueTokens, uint256 uniqueCount)
    {
        uniqueTokens = new TokenWithAmount[](erc20Addresses.length);

        for (uint256 i = 0; i < erc20Addresses.length; i++) {
            bool found = false;
            for (uint256 j = 0; j < uniqueCount; j++) {
                if (uniqueTokens[j].erc20Address == erc20Addresses[i]) {
                    uniqueTokens[j].amount += amounts[i];
                    found = true;
                    break;
                }
            }
            if (!found) {
                uniqueTokens[uniqueCount] = TokenWithAmount({
                    erc20Address: erc20Addresses[i],
                    amount: amounts[i]
                });
                uniqueCount++;
            }
        }
    }

    function _createProoflessDepositCommitments(
        address[] calldata erc20Addresses,
        uint256[] calldata amounts,
        StealthAddressStructure[] calldata stealthAddressStructures,
        bytes[] calldata onChainEncryptedOutputs
    ) private {
        uint256 length = erc20Addresses.length;
        OnChainCommitment[]
            memory onChainCommitmentsArray = new OnChainCommitment[](length);

        for (uint256 i = 0; i < length; i++) {
            onChainCommitmentsArray[i] = createOnchainCommitment(
                UTXO({
                    amount: amounts[i],
                    erc20Address: erc20Addresses[i],
                    stealthAddressStructure: stealthAddressStructures[i],
                    timeStamp: block.timestamp
                }),
                onChainEncryptedOutputs[i]
            );
        }

        insertCommitments(
            new uint256[][](0), // off-chain commitments are empty
            new bytes[][](0), // off-chain encrypted outputs are empty
            onChainCommitmentsArray,
            new bool[](0) // on-chain creation is empty
        );
    }

    function _handleTransfersFromProoflessDeposit(
        TokenWithAmount[] memory uniqueTokens,
        uint256 uniqueCount
    ) private {
        for (uint256 i = 0; i < uniqueCount; i++) {
            address erc20Address = uniqueTokens[i].erc20Address;
            uint256 amount = uniqueTokens[i].amount;

            uint256 balanceBefore = getERC20OrETHBalance(erc20Address);
            if (erc20Address == address(0)) balanceBefore -= msg.value;

            transferERC20TokenFromOrCheckETH(
                erc20Address,
                msg.sender,
                address(this),
                amount
            );

            uint256 balanceAfter = getERC20OrETHBalance(erc20Address);

            require(
                balanceAfter - balanceBefore == amount,
                "proofless deposit balances must be equal"
            );
        }
    }

    function _calculateDeltaAmount(
        CircomData calldata circomData,
        uint256 index
    ) private pure returns (int256) {
        return
            circomData.onChainCreation[index]
                ? int256(0)
                : circomData.amountChanges[index];
    }
}
