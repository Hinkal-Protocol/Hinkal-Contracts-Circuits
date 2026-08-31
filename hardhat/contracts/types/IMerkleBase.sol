// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {IMerkle} from "./IMerkle.sol";

interface IMerkleBase is IMerkle {
    function tree(uint256 index) external view returns (uint256);
    function roots(uint256 index) external view returns (uint256);
    function m_index() external view returns (uint128);
}