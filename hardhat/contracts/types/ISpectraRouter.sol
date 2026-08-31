// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

interface IRouter {
    /// @notice Executes a sequence of commands with their corresponding inputs
    /// @param commands The byte-encoded sequence of commands to execute
    /// @param inputs An array of encoded parameters corresponding to each command
    /// @dev This function is payable to handle operations that may require ETH
    function execute(bytes calldata commands, bytes[] calldata inputs) external payable;
}