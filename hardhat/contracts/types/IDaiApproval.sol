// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

interface IDaiApproval {
    function permit(
        address holder,
        address spender,
        uint256 nonce,
        uint256 expiry,
        bool allowed,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
}
