// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {IHinkalHelper} from "../../../types/IHinkalHelper.sol";

contract EmporiumStorage {
    /// @custom:storage-location erc7201:hinkal.storage.Emporium
    struct EmporiumStorageVars {
        IHinkalHelper _hinkalHelper; // Hinkal Helper may change implementation
        mapping(uint256 => bool) usedMessages;
    }

    // keccak256(abi.encode(uint256(keccak256("hinkal.storage.Emporium")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant EmporiumStorageLocation =
        0xf10f423c12af70b7aa31f6f1bd94310f38d85adab8d26b5c90b7f07c98bf0800;

    function _getEmporiumStorage()
        internal
        pure
        returns (EmporiumStorageVars storage $)
    {
        assembly {
            $.slot := EmporiumStorageLocation
        }
    }
}
