// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

uint256 constant CIRCOM_P = 21888242871839275222246405745257275088548364400416034343698204186575808495617; // https://docs.circom.io/circom-language/basic-operators/

uint constant HINKAL_EMPORIUM_ACTION_ID = uint(keccak256("Emporium")) %
    CIRCOM_P;

uint constant HINKAL_WALLET_ACTION_ID = uint(keccak256("Wallet")) % CIRCOM_P;

bytes4 constant APPROVE_SELECTOR = 0x095ea7b3;
