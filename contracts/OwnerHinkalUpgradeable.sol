// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {Ownable2StepUpgradeable} from "@openzeppelin/contracts-upgradeable/access/Ownable2StepUpgradeable.sol";

contract OwnerHinkalUpgradeable is Ownable2StepUpgradeable {
    function renounceOwnership() public view override onlyOwner {
        revert("The Ownership cannot be renounced");
    }
}
