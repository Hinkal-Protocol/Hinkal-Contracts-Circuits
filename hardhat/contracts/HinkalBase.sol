// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";
import {IHinkalBase} from "./types/IHinkalBase.sol";
import {IHinkalHelper} from "./types/IHinkalHelper.sol";
import {IMerkle} from "./types/IMerkle.sol";
import {Merkle} from "./Merkle.sol";
import {Transferer} from "./Transferer.sol";
import {CircomData} from "./types/CircomData.sol";
import {UTXO, OnChainCommitment} from "./types/UTXO.sol";
import {Dimensions} from "./types/Dimensions.sol";

///@title Base class for Hinkal Contract
contract HinkalBase is
    IHinkalBase,
    Merkle,
    Transferer,
    AccessControl,
    ReentrancyGuard
{
    mapping(uint256 => bool) public nullifiers;
    mapping(uint256 => address) public externalActionMap;
    IHinkalHelper public hinkalHelper;

    bytes32 public constant HINKAL_HELPER_MANAGER =
        keccak256("HINKAL_HELPER_MANAGER");

    constructor(
        IMerkle.MerkleConstructorArgs memory constructorArgs,
        address _hinkalHelper,
        address _hinkalHelperManager
    ) Merkle(constructorArgs) {
        hinkalHelper = IHinkalHelper(_hinkalHelper);
        _setRoleAdmin(HINKAL_HELPER_MANAGER, HINKAL_HELPER_MANAGER);
        _grantRole(HINKAL_HELPER_MANAGER, _hinkalHelperManager);
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    receive() external payable {}

    ///@notice set the hinkal helper.
    ///@dev See HinkalHelper contract
    ///@param _hinkalHelper ethereum address of hinkal helper contract
    function setHinkalHelper(
        address _hinkalHelper
    ) external onlyRole(HINKAL_HELPER_MANAGER) {
        hinkalHelper = IHinkalHelper(_hinkalHelper);
    }

    ///@notice insert user commitments to merkle tree.
    function createOnchainCommitment(
        UTXO memory utxo,
        bytes calldata onChainEncryptedOutput
    ) internal view returns (OnChainCommitment memory) {
        uint256 commitment = hash4(
            utxo.amount,
            uint256(uint160(utxo.erc20Address)),
            utxo.stealthAddressStructure.stealthAddress,
            utxo.timeStamp
        );

        OnChainCommitment memory onChainCommitment = OnChainCommitment({
            utxo: utxo,
            commitment: commitment,
            onChainEncryptedOutput: onChainEncryptedOutput
        });
        return onChainCommitment;
    }

    function insertCommitments(
        uint256[][] memory offChainCommitments,
        bytes[][] memory offChainEncryptedOutputs,
        OnChainCommitment[] memory onChainCommitments,
        bool[] memory onChainCreation
    ) internal {
        // 1) Total Length of Commitments
        uint256 length = 0;
        for (uint256 i = 0; i < offChainCommitments.length; i++) {
            for (uint256 j = 0; j < offChainCommitments[i].length; j++) {
                if (onChainCreation[i]) break;
                length += offChainCommitments[i][j] != 0 ? 1 : 0;
            }
        }
        length += onChainCommitments.length;

        if (length > 0) {
            // 2) Flattening leaves array
            uint256[] memory leaves = new uint256[](length);
            uint256 index = 0;
            for (uint256 i = 0; i < offChainCommitments.length; i++) {
                for (uint256 j = 0; j < offChainCommitments[i].length; j++) {
                    if (onChainCreation[i] == true) break;
                    if (offChainCommitments[i][j] != 0) {
                        leaves[index++] = offChainCommitments[i][j];
                    }
                }
            }
            for (uint256 i = 0; i < onChainCommitments.length; i++) {
                leaves[index++] = onChainCommitments[i].commitment;
            }

            // 3) Inserting Leaves
            uint256[] memory insertedIndexes = insertMany(leaves);

            // 4) Emitting Commitments/EncryptedOutputs
            index = 0;
            for (uint256 i = 0; i < offChainEncryptedOutputs.length; i++) {
                for (uint256 j = 0; j < offChainEncryptedOutputs[i].length; j++) {
                    if (onChainCreation[i] == true) break;
                    if (offChainCommitments[i][j] != 0) {
                        emit NewCommitment(
                            leaves[index],
                            int256(insertedIndexes[index]),
                            offChainEncryptedOutputs[i][j]
                        );
                        index++;
                    }
                }
            }
            for (uint256 i = 0; i < onChainCommitments.length; i++) {
                emit NewCommitment(
                    leaves[index],
                    -1 * int256(insertedIndexes[index++]),
                    abi.encode(
                        onChainCommitments[i].utxo,
                        onChainCommitments[i].onChainEncryptedOutput
                    )
                );
            }
        }
    }

    function insertNullifiers(
        uint256[][] calldata inputNullifiers,
        bool[] calldata onChainCreation
    ) internal {
        for (uint256 i = 0; i < inputNullifiers.length; i++) {
            for (uint256 j = 0; j < inputNullifiers[i].length; j++) {
                if (onChainCreation[i] == true) break;
                if (inputNullifiers[i][j] != 0) {
                    require(
                        !nullifiers[inputNullifiers[i][j]],
                        "Nullifier cannot be reused"
                    );
                    nullifiers[inputNullifiers[i][j]] = true;
                    emit Nullified(inputNullifiers[i][j]);
                }
            }
        }
    }

    function markUtxosAsBlocked() internal {
        emit BlockedUtxosCreated();
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override(AccessControl, Transferer) returns (bool) {
        return AccessControl.supportsInterface(interfaceId);
    }
}
