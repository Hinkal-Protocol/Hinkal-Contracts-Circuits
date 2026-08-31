// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import {CircomData} from "../types/CircomData.sol";
import {UTXO} from "../types/UTXO.sol";
import {IExternalActionV2} from "../types/IExternalActionV2.sol";
import {OwnerHinkalUpgradeable} from "../OwnerHinkalUpgradeable.sol";

abstract contract ExternalActionBaseUpgradeable is
    IExternalActionV2,
    Initializable,
    OwnerHinkalUpgradeable
{
    /// @custom:storage-location erc7201:hinkal.storage.ExternalActionBase
    struct ExternalActionBaseStorage {
        mapping(address => bool) _isAllowedRecipient;
    }

    // keccak256(abi.encode(uint256(keccak256("hinkal.storage.ExternalActionBase")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ExternalActionBaseLocation =
        0x9d2f4759597c58de92aac5a642b36c9396ab332f6bf77a6219b0a830d5486c00;

    function _getExternalActionBaseStorage()
        private
        pure
        returns (ExternalActionBaseStorage storage $)
    {
        assembly {
            $.slot := ExternalActionBaseLocation
        }
    }

    /*
     * @dev Modifier to check if the sender is allowed to call the action
     * @dev Used to handle VolatileTokenAction and Hinkal interactions
     */
    modifier onlyAllowedRecipient() {
        ExternalActionBaseStorage storage $ = _getExternalActionBaseStorage();
        require(
            $._isAllowedRecipient[msg.sender],
            "ExternalActionBase: sender not allowed"
        );
        _;
    }

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function __ExternalActionBase_init(
        address[] memory _allowedRecipients
    ) public onlyInitializing {
        __Ownable2Step_init();
        ExternalActionBaseStorage storage $ = _getExternalActionBaseStorage();

        for (uint256 i = 0; i < _allowedRecipients.length; i++) {
            $._isAllowedRecipient[_allowedRecipients[i]] = true;
        }
    }

    function setAllowedRecipients(
        address[] calldata recipients
    ) external onlyOwner {
        ExternalActionBaseStorage storage $ = _getExternalActionBaseStorage();

        for (uint256 i = 0; i < recipients.length; i++) {
            require(recipients[i] != address(0), "zero address!");
            $._isAllowedRecipient[recipients[i]] = true;
        }
    }

    function runAction(
        CircomData calldata circomData,
        int256[] calldata deltaAmountChanges
    ) external virtual returns (UTXO[] memory utxoSet) {}
}
