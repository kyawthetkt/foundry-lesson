// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2, stdError} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.count(), 1);
    }

    function testFailDecrement() public {
        counter.decrement();
    }

    function testDecrementUnderflow() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.decrement();
    }

    function testDecrement() public {
        counter.increment();
        counter.increment();
        counter.increment();
        counter.decrement();
        assertEq(counter.count(), 2);
    }
}
