// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

interface IPTHeth{
    ///@notice returns address of an interest bearing token registered in Principal Token
    ///@return address of an interest bearing token  
    function getIBT() external view returns (address);
    
    ///@notice returns address of an yield token registered in Principal Token
    ///@return address of an yield token
    function getYT() external view returns(address);
    
    ///@notice claims generated yield and converts it into corresponding amount of an interest bearin token
    ///@param receiver is an address which receives ibt after claim
    ///@param minIBT is a min-amount of ibt's that should be received
    ///@return amount of an interest bearing tokens
    function claimYieldInIBT(address receiver, uint256 minIBT) external returns (uint256);
    
    ///@notice returns expiry date of a principal token
    ///@return date representation in uint256
    function maturity() external view returns (uint256);
}