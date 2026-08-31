// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

struct EmporiumOperation {
    address endpoint;
    bool invokeWallet;
    uint128 value;
    bytes callData;
}

struct EmporiumStack {
    uint8 v;
    bytes32 r;
    bytes32 s;
    address signerAddress;
    EmporiumOperation[] ops;
    uint256 maxFee;
    uint256 deadline;
}
