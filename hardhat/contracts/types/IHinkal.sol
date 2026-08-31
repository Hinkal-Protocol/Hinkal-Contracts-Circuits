// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.6;

import {Dimensions} from "../types/Dimensions.sol";
import {CircomData} from "../types/CircomData.sol";
import {StealthAddressStructure} from "./StealthAddressStructure.sol";

interface IHinkal {
    event ExternalActionRegistered(address externalActionAddress);

    struct ConstructorArgs {
        uint256 levels;
        address poseidon;
        address circomDataBuilderAddress;
        address erc20TokenRegistryAddress;
        address relayStoreAddress;
    }

    function transact(
        uint256[2] calldata a,
        uint256[2][2] calldata b,
        uint256[2] calldata c,
        Dimensions calldata dimensions,
        CircomData calldata circomData
    ) external payable;

    function prooflessDeposit(
        address[] calldata erc20Addresses,
        uint256[] calldata amounts,
        StealthAddressStructure[] calldata stealthAddressStructures,
        bytes[] calldata encryptedOutputs,
        bool createBlockedUtxos,
        string calldata orderId
    ) external payable;
}
