// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {Hinkal} from "./Hinkal.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable2Step.sol";
import {IAccessControl} from "@openzeppelin/contracts/access/IAccessControl.sol";
import {IMerkle} from "./types/IMerkle.sol";

contract HinkalFactory is Ownable {
    error ZeroAdmin();
    error AlreadyDeployed();
    error BytecodeHashMismatch();
    error FailedToDeploy();

    event HinkalDeployed(
        address hinkal,
        IMerkle.MerkleConstructorArgs constructorArgs,
        address _hinkalHelper,
        address _hinkalHelperManager
    );

    address public hinkal;
    bytes32 public bytecodeHash;
    mapping(uint256 => bytes) public bytecodeChunks;
    uint256 public bytecodeChunkCount;
    bytes32 public constant DEFAULT_ADMIN_ROLE = 0x00;

    // we can't use `new Hinkal` since it makes this contract too large to be deployable
    // so instead we save bytecode inside storage and use that to deploy the contract
    constructor(address admin, bytes32 _bytecodeHash) {
        if (admin == address(0)) {
            revert ZeroAdmin();
        }
        _transferOwnership(admin);
        bytecodeHash = _bytecodeHash;
    }

    function appendBytecodeChunk(bytes calldata chunk) external onlyOwner {
        bytecodeChunks[bytecodeChunkCount] = chunk;
        bytecodeChunkCount += 1;
    }

    function resetBytecodeChunks() external onlyOwner {
        for (uint256 i = 0; i < bytecodeChunkCount; i++) {
            delete bytecodeChunks[i];
        }
        bytecodeChunkCount = 0;
    }

    function deployContract(
        bytes memory bytecodeWithArgs
    ) internal returns (address contractAddress) {
        assembly {
            contractAddress := create(
                0,
                add(bytecodeWithArgs, 0x20),
                mload(bytecodeWithArgs)
            )
        }
        if (contractAddress == address(0)) revert FailedToDeploy();
    }

    function deployHinkal(
        IMerkle.MerkleConstructorArgs memory constructorArgs,
        address _hinkalHelper,
        address _hinkalHelperManager
    ) external onlyOwner returns (address) {
        if (hinkal != address(0)) revert AlreadyDeployed();
        if (bytecodeHash == bytes32(0)) revert BytecodeHashMismatch();

        bytes memory fullBytecode;
        for (uint256 i = 0; i < bytecodeChunkCount; i++) {
            fullBytecode = bytes.concat(fullBytecode, bytecodeChunks[i]);
        }
        if (keccak256(fullBytecode) != bytecodeHash)
            revert BytecodeHashMismatch();

        bytes memory argsInBytes = abi.encode(
            constructorArgs,
            _hinkalHelper,
            _hinkalHelperManager
        );

        bytes memory bytecodeWithArgs = abi.encodePacked(
            fullBytecode,
            argsInBytes
        );

        hinkal = deployContract(bytecodeWithArgs);
        Ownable(hinkal).transferOwnership(msg.sender);
        IAccessControl(hinkal).grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        IAccessControl(hinkal).renounceRole(DEFAULT_ADMIN_ROLE, address(this));

        emit HinkalDeployed(
            hinkal,
            constructorArgs,
            _hinkalHelper,
            _hinkalHelperManager
        );

        return hinkal;
    }
}
