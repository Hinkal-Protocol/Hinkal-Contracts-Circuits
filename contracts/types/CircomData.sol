// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.6;

import {StealthAddressStructure} from "./StealthAddressStructure.sol";

struct FeeStructure {
    address feeToken;
    uint256 flatFee;
    uint256 variableRate; // measured in beeps = 0.01 of 1%
}

struct ExternalActionData {
    address externalAddress;
    uint256 externalActionId;
    bytes externalActionMetadata;
}
struct HookData {
    address preHookContract;
    address postHookContract;
    bytes preHookMetadata;
    bytes postHookMetadata;
}
struct CircomData {
    uint256 rootHashHinkal;
    uint256 rootHashHinkalIndex;
    address[] erc20TokenAddresses;
    int256[] amountChanges;
    uint256[][] inputNullifiers;
    uint256[][] outCommitments;
    bytes[][] encryptedOutputs;
    bytes onChainEncryptedOutput;
    bool[] onChainCreation;
    int256[] slippageValues;
    FeeStructure feeStructure;
    StealthAddressStructure stealthAddressStructure;
    uint256 timeStamp;
    uint256 calldataHash;
    uint256 emporiumMessage;
    uint16 publicSignalCount;
    address relay;
    ExternalActionData externalActionData;
    HookData hookData;
    address originalSender;
    bytes extraData;
}
