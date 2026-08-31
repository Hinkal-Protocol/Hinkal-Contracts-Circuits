// SPDX-License-Identifier: BUSL-1.1
pragma solidity >=0.8.0;

import "./CircomData.sol";

interface ICircomDataBuilder {
    function getHashedCalldata(
        CircomData memory circomData
    ) external pure returns (uint256);

    function formInputForCircom(
        uint256 chainId,
        address verifyingContract,
        CircomData memory circomData
    ) external pure returns (uint256[] memory input);
}
