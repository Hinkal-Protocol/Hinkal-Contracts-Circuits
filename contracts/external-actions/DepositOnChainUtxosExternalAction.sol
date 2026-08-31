// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "../Transferer.sol";
import "../types/UTXO.sol";
import "../types/CircomData.sol";

import {ExternalActionBaseV2} from "./ExternalActionBaseV2.sol";

/// @title DepositOnChainUtxosExternalAction
/// @notice Deposits tokens into Hinkal and creates on-chain UTXOs whose commitments
/// are fully determined by the caller, because their timestamps come from
/// circomData.timeStamp rather than from the block.
contract DepositOnChainUtxosExternalAction is Transferer, ExternalActionBaseV2 {
    event BlockedUtxosCreated();

    constructor(
        address[] memory _allowedRecipients
    ) ExternalActionBaseV2(_allowedRecipients) {}

    function runAction(
        CircomData calldata circomData,
        int256[] calldata deltaAmounts
    ) external override onlyAllowedRecipient returns (UTXO[] memory utxoSet) {
        uint256 tokenCount = circomData.erc20TokenAddresses.length;
        require(
            tokenCount > 0 && deltaAmounts.length == tokenCount,
            "DepositOnChainUtxosExternalAction: token count mismatch"
        );

        address userAddress = circomData.originalSender;
        require(
            userAddress != address(0),
            "DepositOnChainUtxosExternalAction: Invalid originalSender"
        );

        uint256[][] memory utxoAmounts = abi.decode(
            circomData.externalActionData.externalActionMetadata,
            (uint256[][])
        );
        require(
            utxoAmounts.length == tokenCount,
            "DepositOnChainUtxosExternalAction: metadata length mismatch"
        );

        utxoSet = new UTXO[](countUtxos(utxoAmounts));

        uint256 utxoIndex = 0;
        for (uint256 i = 0; i < tokenCount; i++) {
            require(
                deltaAmounts[i] == 0,
                "DepositOnChainUtxosExternalAction: Delta amount must be zero"
            );

            address tokenAddress = circomData.erc20TokenAddresses[i];
            uint256 tokenTotal = 0;

            for (uint256 j = 0; j < utxoAmounts[i].length; j++) {
                uint256 amount = utxoAmounts[i][j];
                require(
                    amount > 0,
                    "DepositOnChainUtxosExternalAction: UTXO amount must be positive"
                );
                tokenTotal += amount;

                utxoSet[utxoIndex] = UTXO({
                    amount: amount,
                    erc20Address: tokenAddress,
                    stealthAddressStructure: circomData.stealthAddressStructure,
                    timeStamp: circomData.timeStamp + utxoIndex
                });
                utxoIndex++;
            }

            if (tokenAddress != address(0) && tokenTotal > 0) {
                transferERC20TokenFrom(
                    tokenAddress,
                    userAddress,
                    msg.sender,
                    tokenTotal
                );
            }
        }

        emit BlockedUtxosCreated();
    }

    function countUtxos(
        uint256[][] memory utxoAmounts
    ) private pure returns (uint256 total) {
        for (uint256 i = 0; i < utxoAmounts.length; i++) {
            total += utxoAmounts[i].length;
        }
        require(
            total > 0,
            "DepositOnChainUtxosExternalAction: Must specify at least one UTXO"
        );
    }
}
