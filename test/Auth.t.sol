// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    function testSetOwner() public {
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1));
    }

    function testFailNotOwner() public {
        vm.prank(address(1)); // as caller
        // vm.expectRevert(); // works too
        wallet.setOwner(address(1));
    }

    function testFailTestOwner() public {
        // caller = AuthTest's address
        wallet.setOwner(address(1));

        vm.startPrank(address(1)); // caller = address(1)
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        vm.stopPrank(); // caller != address(1)

        wallet.setOwner(address(1));

        /*
        vm.startPrank(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        vm.stopPrank();
        
        is eq to:

        vm.prank(address(1));
        wallet.setOwner(address(1));

        vm.prank(address(1));
        wallet.setOwner(address(1));

        vm.prank(address(1));
        wallet.setOwner(address(1));
        
        */
    }
}
