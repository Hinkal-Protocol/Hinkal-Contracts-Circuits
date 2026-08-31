// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "./ExternalActionSwap.sol";

contract LifiExternalAction is ExternalActionSwap {
    constructor(
        address _hinkalHelper,
        address _wrapper,
        address _router,
        address[] memory _allowedRecipients
    )
        ExternalActionSwap(_hinkalHelper, _wrapper, _router, _allowedRecipients)
    {}

    function callRouter(
        address inputToken,
        uint256 inputAmount,
        address outputToken,
        bytes calldata externalActionMetadata
    ) internal override returns (uint256 swappedAmount) {
        uint256 balanceBefore = getERC20OrETHBalance(outputToken);

        if (inputToken == address(0)) {
            (bool success, ) = router.call{value: inputAmount}(
                externalActionMetadata
            );
            require(success, "LI.FI swap failed: native coin");
        } else {
            approveUnlimited(inputToken, router);
            (bool success, ) = router.call(externalActionMetadata);
            require(success, "LI.FI swap failed: erc-20 token");
        }

        swappedAmount = getERC20OrETHBalance(outputToken) - balanceBefore;
    }
}
