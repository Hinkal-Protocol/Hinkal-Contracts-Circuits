// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../../Transferer.sol";

interface ISwapFeeTaker {
    function takeSwapFee(
        address token,
        uint256 beforeBalance,
        uint256 variableRate,
        address relay
    ) external payable;
}

contract SwapFeeTaker is Transferer, ISwapFeeTaker {
    function takeSwapFee(
        address outputToken,
        uint256 beforeBalance,
        uint256 variableRate,
        address relay
    ) external payable {
        address sender = msg.sender;

        uint256 currentBalance;
        if (outputToken == address(0)) {
            revert("Native Token not supported in SwapFeeTaker");
        } else {
            IERC20 outToken = IERC20(outputToken);
            currentBalance = outToken.balanceOf(address(sender));
        }

        uint256 difference = currentBalance - beforeBalance;
        require(
            difference > 0,
            "There should be a difference in the swap value"
        );

        transferERC20TokenFrom(outputToken, sender, address(this), difference);

        uint256 variableFee = (difference * variableRate) / 10000;

        sendToRelay(relay, variableFee, outputToken);

        transferERC20Token(outputToken, sender, difference - variableFee);
    }
}
