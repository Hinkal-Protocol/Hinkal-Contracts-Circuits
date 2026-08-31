// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.6;

import {CircomData} from "./CircomData.sol";
import {UTXO} from "./UTXO.sol";

interface IExternalAction {
    function runAction(
        CircomData calldata circomData
    ) external returns (UTXO[] memory);
}
