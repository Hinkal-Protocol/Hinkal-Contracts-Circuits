// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

interface ISpectraHethPool{
    /// @notice returns lp token registerd in the pool
    /// @return address of a lp token 
    function token() external view returns(address);
}