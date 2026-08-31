// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {IERC165} from "@openzeppelin/contracts/interfaces/IERC165.sol";
import {IERC1271} from "@openzeppelin/contracts/interfaces/IERC1271.sol";
import {Transferer} from "../../Transferer.sol";
import {IHinkalWallet} from "../../types/IHinkalWallet.sol";

contract HinkalWallet is Transferer, IHinkalWallet {
    address public immutable emporium;

    event EthReceivedOnWallet(address indexed sender, uint256 amount);

    error NotAllowedToCallWallet();

    constructor(address _emporium) {
        emporium = _emporium;
    }

    modifier onlyEmporium() {
        if (msg.sender != emporium) {
            revert NotAllowedToCallWallet();
        }
        _;
    }

    function callHinkalWallet(
        address endpoint,
        bytes calldata data,
        uint value
    ) external onlyEmporium returns (bool success, bytes memory err) {
        (success, err) = endpoint.call{value: value}(data);
    }

    function doSendToRelay(
        address relay,
        uint256 actualAmount,
        address erc20TokenAddress
    ) external onlyEmporium {
        sendToRelay(relay, actualAmount, erc20TokenAddress);
    }

    // EIP-1271: https://eips.ethereum.org/EIPS/eip-1271
    function isValidSignature(
        bytes32 _hash,
        bytes memory _signature
    ) external view returns (bytes4) {
        (address addr, ECDSA.RecoverError err) = ECDSA.tryRecover(
            _hash,
            _signature
        );

        bool verified = err == ECDSA.RecoverError.NoError &&
            addr == address(this);

        return bytes4(verified ? 0x1626ba7e : 0xffffffff);
    }

    // EIP-165: Supports the following interfaces: IERC721Receiver, IERC1155Receiver, IERC165, IERC1271
    function supportsInterface(
        bytes4 _interfaceId
    ) public view virtual override(Transferer) returns (bool) {
        return
            super.supportsInterface(_interfaceId) ||
            _interfaceId == type(IERC165).interfaceId ||
            _interfaceId == type(IERC1271).interfaceId;
    }

    receive() external payable {
        emit EthReceivedOnWallet(msg.sender, msg.value);
    }
}
