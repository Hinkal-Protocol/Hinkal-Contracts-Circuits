// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {IRelayStore} from "./IRelayStore.sol";
import {Dimensions} from "./Dimensions.sol";
import {CircomData} from "./CircomData.sol";
import {StealthAddressStructure} from "./StealthAddressStructure.sol";

interface IHinkalHelper is IRelayStore {
    function relayerIsValid(address relay) external view;
    function performHinkalChecks(
        CircomData calldata circomData,
        Dimensions calldata dimensions,
        address sender
    ) external view returns (uint256[] memory);

    function performProoflessDepositChecks(
        address[] calldata erc20Addresses,
        uint256[] calldata amounts,
        StealthAddressStructure[] calldata stealthAddressStructures,
        bytes[] calldata onChainEncryptedOutputs
    ) external view;

    function performSideEffects(CircomData calldata circomData) external;
}
