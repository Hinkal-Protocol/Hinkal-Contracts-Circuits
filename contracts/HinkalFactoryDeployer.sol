// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {HinkalFactory} from "./HinkalFactory.sol";

contract HinkalFactoryDeployer {
    address public constant SAFE_SINGLETON_FACTORY =
        0x914d7Fec6aaC8cd542e72Bca78B30650d45643d7;

    address public factoryAddress;

    error FailedToDeploy();

    constructor(address admin, bytes32 bytecodeHash) {
        (bool success, bytes memory result) = SAFE_SINGLETON_FACTORY.call(
            abi.encodePacked(
                keccak256("HINKAL"),
                type(HinkalFactory).creationCode,
                abi.encode(admin, bytecodeHash)
            )
        );

        if (!success) {
            revert FailedToDeploy();
        }

        factoryAddress = address(bytes20(result));
    }
}
