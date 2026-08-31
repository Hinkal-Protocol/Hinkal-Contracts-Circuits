// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "./Transferer.sol";
import "./OwnerHinkal.sol";
import "./types/IHinkal.sol";
import "./types/StealthAddressStructure.sol";
import "./types/ProoflessFeeStructure.sol";

/// @title HinkalWrapper
/// @notice Settles the protocol fee for a proofless deposit, then forwards the
/// deposit itself to Hinkal (which has no fee-taking logic of its own).
contract HinkalWrapper is Transferer, OwnerHinkal {
    address internal hinkal;

    constructor(address _hinkal) {
        require(_hinkal != address(0), "HinkalWrapper: Invalid Hinkal address");
        hinkal = _hinkal;
    }

    receive() external payable {}

    function setHinkalAddress(address _hinkal) external onlyOwner {
        require(_hinkal != address(0), "HinkalWrapper: Invalid Hinkal address");
        hinkal = _hinkal;
    }

    function prooflessDeposit(
        address[] calldata erc20Addresses,
        uint256[] calldata amounts,
        StealthAddressStructure[] calldata stealthAddressStructures,
        bytes[] calldata onChainEncryptedOutputs,
        bool createBlockedUtxos,
        ProoflessFeeStructure calldata feeStructure,
        string calldata orderId
    ) external payable {
        uint256 ethForHinkal = _settleFee(feeStructure);
        _pullAndApproveDepositTokens(erc20Addresses, amounts);
        IHinkal(hinkal).prooflessDeposit{value: ethForHinkal}(
            erc20Addresses,
            amounts,
            stealthAddressStructures,
            onChainEncryptedOutputs,
            createBlockedUtxos,
            orderId
        );
    }

    function _settleFee(
        ProoflessFeeStructure calldata feeStructure
    ) internal returns (uint256 ethForHinkal) {
        ethForHinkal = msg.value;
        if (feeStructure.feeToken == address(0)) {
            require(
                msg.value >= feeStructure.feeAmount,
                "insufficient ETH for fee"
            );
            ethForHinkal = msg.value - feeStructure.feeAmount;
            if (feeStructure.feeAmount > 0) {
                transferETH(feeStructure.feeRecipient, feeStructure.feeAmount);
            }
        } else if (feeStructure.feeAmount > 0) {
            transferERC20TokenFrom(
                feeStructure.feeToken,
                msg.sender,
                feeStructure.feeRecipient,
                feeStructure.feeAmount
            );
        }
    }

    function _pullAndApproveDepositTokens(
        address[] calldata erc20Addresses,
        uint256[] calldata amounts
    ) internal {
        uint256 len = erc20Addresses.length;
        address[] memory uniqueTokens = new address[](len);
        uint256[] memory uniqueAmounts = new uint256[](len);
        uint256 uniqueCount;

        for (uint256 i = 0; i < len; i++) {
            address token = erc20Addresses[i];
            if (token == address(0) || amounts[i] == 0) continue;

            transferERC20TokenFrom(
                token,
                msg.sender,
                address(this),
                amounts[i]
            );

            uint256 idx = uniqueCount;
            for (uint256 j = 0; j < uniqueCount; j++) {
                if (uniqueTokens[j] == token) {
                    idx = j;
                    break;
                }
            }
            if (idx == uniqueCount) {
                uniqueTokens[uniqueCount] = token;
                uniqueCount++;
            }
            uniqueAmounts[idx] += amounts[i];
        }

        for (uint256 k = 0; k < uniqueCount; k++) {
            approveERC20Token(uniqueTokens[k], hinkal, uniqueAmounts[k]);
        }
    }
}
