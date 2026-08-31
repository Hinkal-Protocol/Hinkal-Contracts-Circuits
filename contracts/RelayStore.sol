// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IRelayStore} from "./types/IRelayStore.sol";

///@title Storage class for Relayer data
contract RelayStore is Ownable, IRelayStore {
    // 1-based index into relayStore; 0 means address is not in the list
    mapping(address => uint256) private relayIndex;
    address[] public relayStore;

    constructor(address[] memory initialRelays) {
        for (uint16 i = 0; i < initialRelays.length; i++) {
            addRelay(initialRelays[i]);
        }
    }

    function isRelayInList(address relayAddress) public view returns (bool) {
        return relayIndex[relayAddress] != 0;
    }

    ///@notice obtain relayer store
    ///@dev We need seperate Relayer store to return list of all relayers to frontend
    ///@return relayStore List of all Relayers
    function getRelayStore() external view returns (address[] memory) {
        return relayStore;
    }

    function removeRelay(address _relayAddress) external onlyOwner {
        uint256 index = relayIndex[_relayAddress];
        require(index != 0, "Relayer not in list");

        uint256 lastIndex = relayStore.length;
        if (index != lastIndex) {
            address lastRelay = relayStore[lastIndex - 1];
            relayStore[index - 1] = lastRelay;
            relayIndex[lastRelay] = index;
        }

        relayStore.pop();
        delete relayIndex[_relayAddress];
        emit RelayRemoved(_relayAddress);
    }

    function addRelay(address _relayAddress) public onlyOwner {
        require(
            _relayAddress != address(0),
            "Relay address cannot be zero address"
        );
        require(relayIndex[_relayAddress] == 0, "Relay already in list");

        relayStore.push(_relayAddress);
        relayIndex[_relayAddress] = relayStore.length;

        emit RelayAdded(_relayAddress);
    }

    function calculateRelayFee(
        uint256 balance,
        uint256 flatFee,
        uint256 variableRate
    ) public pure returns (uint256 relayFee) {
        require(balance >= flatFee, "Relay Fee is over withdraw amount");
        uint256 recipientAmount = ((10000 - variableRate) *
            (balance - flatFee)) / 10000;
        relayFee = balance - recipientAmount;
    }
}
