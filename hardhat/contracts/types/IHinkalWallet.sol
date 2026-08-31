// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

interface IHinkalWallet {
    function callHinkalWallet(
        address endpoint,
        bytes calldata data,
        uint value
    ) external returns (bool success, bytes memory err);

    function doSendToRelay(
        address relay,
        uint256 actualAmount,
        address erc20TokenAddress
    ) external;

    function isValidSignature(
        bytes32 _hash,
        bytes memory _signature
    ) external view returns (bytes4);
}
