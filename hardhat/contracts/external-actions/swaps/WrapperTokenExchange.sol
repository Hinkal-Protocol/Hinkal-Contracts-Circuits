// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../../types/IWrapper.sol";
import "../../Transferer.sol";

contract WrapperTokenExchange is Transferer {
    IWrapper public immutable wrapper;

    constructor(address _wrapper) {
        require(_wrapper != address(0), "Invalid wrapper address");
        wrapper = IWrapper(_wrapper);
    }

    function withdrawBalanceDifference(uint256 beforeBalance) external {
        address sender = msg.sender;
        uint256 currentBalance = wrapper.balanceOf(sender);

        uint256 difference = currentBalance - beforeBalance;
        require(difference > 0, "No withdrawal needed");

        transferERC20TokenFrom(address(wrapper), sender, address(this), difference);

        wrapper.withdraw(difference);

        (bool success, ) = sender.call{value: difference}("");
        require(success, "ETH transfer failed");
    }

    receive() external payable {}
}
