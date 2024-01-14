// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Test, console2, stdError} from "forge-std/Test.sol";
import {Auction} from "../src/Auction.sol";

/*
    vm.wrap = set current timestamp tp future timestamp
    vm.roll = set block.number to future block.number
    skip = increment current timestamp
    rewind = decrement current timestamp
*/

contract TImeTest is Test {
    Auction public auction;
    uint256 private startAt;

    function setUp() public {
        auction = new Auction();
        startAt = block.timestamp;
    }

    function testBidFailsBeforeStartTime() public {
        vm.expectRevert(bytes("Auction not started yet"));
        auction.bid();
    }

    function testBid() public {
        vm.warp(startAt + 1 days);
        auction.bid();
    }

    function testEndFailsAfterEndTime() public {
        vm.expectRevert(bytes("Auction not started yet"));
        vm.warp(startAt + 2 days);
        auction.bid();
    }

    function testTimestamp() public {
        uint256 t= block.timestamp;
        // skip
        skip(100);
        assertEq(block.timestamp, t + 100);

        // rewind
        rewind(100);
        assertEq(block.timestamp, t);
    }

    function testBlockNumber() public {
        uint256 n = block.number;
        // roll
        vm.roll(100);
        assertEq(block.number, 100);
    }
}
