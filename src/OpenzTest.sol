// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";

contract OpenzTest is Ownable {
    constructor(address initialOwner) Ownable(initialOwner) {}
}
