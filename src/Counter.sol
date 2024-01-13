// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract Counter {
    uint256 public count;

    function get() public view returns (uint256) {
        return count;
    }

    function increment() public {
        console.log("calling increment method");
        count += 1;
    }

    function decrement() public {
        console.log("calling decrement method");
        count -= 1;
    }
}
