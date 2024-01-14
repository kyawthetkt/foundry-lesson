// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Test, console2, stdError} from "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public evt;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        evt = new Event();
    }

    function testEmitTransferEvent() public {
        vm.expectEmit(true, true, false, false);

        emit Transfer(address(this), address(1), 1233);

        evt.transfer(address(this), address(1), 1233);
    }

    function testEmitTransferManyEvent() public {
        vm.expectEmit(true, true, false, false);

        address[] memory tos = new address[](2);
        tos[0] = address(1);
        tos[1] = address(2);

        uint256[] memory amounts = new uint256[](2);
        amounts[0] = 1233;
        amounts[1] = 1234;

        emit Transfer(address(this), address(1), 1233);
        emit Transfer(address(this), address(2), 1234);

        evt.transferMany(address(this), tos, amounts);
    }
}
