// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface IWAToken is IERC20 {
    function deposit(uint256 amount) external returns (uint256);

    function convertAmountToUnwrapped(uint256 amount)
        external
        view
        returns (uint256);

    function convertAmountToWrapped(uint256 amount)
        external
        view
        returns (uint256);

    function getReserveNormalizedIncome() external view returns (uint256);

    function withdraw(uint256 amount) external returns (uint256);
}
