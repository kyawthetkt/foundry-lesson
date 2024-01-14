// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Auction {
    uint256 public startAt = block.timestamp + 1 days;
    uint256 public endAt = block.timestamp + 2 days;

    function bid() external view {
        require(block.timestamp >= startAt && block.timestamp < endAt, "Auction not started yet");
    }

    function end() external view {
        require(block.timestamp >= endAt, "Auction not ended yet");
    }
}
