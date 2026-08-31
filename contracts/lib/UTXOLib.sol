// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {UTXO} from "../types/UTXO.sol";

library UTXOLib {
    function skipLast(UTXO[] memory arr, uint n) internal pure {
        assembly {
            mstore(arr, sub(mload(arr), n))
        }
    }
}
