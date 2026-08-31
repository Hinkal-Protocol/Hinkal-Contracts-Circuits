// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

interface IIBT {
    /// @notice Wraps vault shares into interest bearing tokens
    /// @param vaultShares Amount of vault shares to wrap
    /// @param receiver Address to receive the wrapped tokens
    /// @return Amount of interest bearing tokens received
    function wrap(uint256 vaultShares, address receiver) external returns(uint256);

    /// @notice Unwraps interest bearing tokens back to vault shares
    /// @param shares Amount of interest bearing tokens to unwrap
    /// @param receiver Address to receive the vault shares
    /// @param owner Address that owns the interest bearing tokens
    /// @return Amount of vault shares received
    function unwrap(uint256 shares, address receiver, address owner) external returns(uint256);
}