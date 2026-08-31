// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "../../Transferer.sol";
import "../../types/IExternalAction.sol";
import "../../types/IHinkalHelper.sol";
import "../../types/IWrapper.sol";
import "../../types/UTXO.sol";
import "../../types/CircomData.sol";

import {ExternalActionBaseV2} from "../ExternalActionBaseV2.sol";

abstract contract ExternalActionSwap is Transferer, ExternalActionBaseV2 {
    uint256 public constant SWAP_DEADLINE_WINDOW = 10 minutes;

    IHinkalHelper public hinkalHelper;
    IWrapper internal immutable wrapper;
    address public immutable router;

    constructor(
        address _hinkalHelper,
        address _wrapper,
        address _router,
        address[] memory _allowedRecipients
    ) ExternalActionBaseV2(_allowedRecipients) {
        hinkalHelper = IHinkalHelper(_hinkalHelper);
        wrapper = IWrapper(_wrapper);
        router = _router;
    }

    receive() external payable {}

    function runAction(
        CircomData calldata circomData,
        int256[] calldata deltaAmounts
    ) external override onlyAllowedRecipient returns (UTXO[] memory) {
        return swap(circomData, deltaAmounts);
    }

    function swap(
        CircomData calldata circomData,
        int256[] calldata deltaAmounts
    ) internal returns (UTXO[] memory utxoSet) {
        address inputToken = circomData.erc20TokenAddresses[0];
        uint256 inputAmount = uint256(-deltaAmounts[0]);

        if (inputToken == circomData.feeStructure.feeToken) {
            inputAmount -= circomData.feeStructure.flatFee;
        }

        address outputToken = circomData.erc20TokenAddresses[1];

        require(
            circomData.slippageValues[1] != 0,
            "swap output slippage floor not set"
        );

        require(
            block.timestamp <= circomData.timeStamp + SWAP_DEADLINE_WINDOW,
            "swap expired"
        );

        uint256 swappedAmount = callRouter(
            inputToken,
            inputAmount,
            outputToken,
            circomData.externalActionData.externalActionMetadata
        );

        uint256 relayFee = circomData.feeStructure.flatFee;

        uint256 hinkalFee = hinkalHelper.calculateRelayFee(
            swappedAmount,
            0,
            circomData.feeStructure.variableRate
        );

        if (circomData.feeStructure.feeToken == outputToken) {
            sendToRelay(circomData.relay, relayFee + hinkalFee, outputToken);
        } else {
            sendToRelay(
                circomData.relay,
                relayFee,
                circomData.feeStructure.feeToken
            );
            sendToRelay(circomData.relay, hinkalFee, outputToken);
        }

        uint256 totalFee = hinkalFee +
            (outputToken == circomData.feeStructure.feeToken ? relayFee : 0);
        uint256 amountToSendToHinkal = swappedAmount - totalFee;

        transferERC20TokenOrETH(outputToken, msg.sender, amountToSendToHinkal);

        utxoSet = new UTXO[](1);
        utxoSet[0] = UTXO({
            amount: amountToSendToHinkal,
            erc20Address: outputToken,
            stealthAddressStructure: circomData.stealthAddressStructure,
            timeStamp: block.timestamp
        });
    }

    function callRouter(
        address inputToken,
        uint256 inputAmount,
        address outputToken,
        bytes calldata externalActionMetadata
    ) internal virtual returns (uint256 swappedAmount);

    function setHinkalHelper(address newHinkalHelper) public onlyOwner {
        hinkalHelper = IHinkalHelper(newHinkalHelper);
    }
}
