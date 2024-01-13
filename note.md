
### gas-report
forge test --match-path test/Counter.t.sol --gas-report

### vm.expectRevert

    function testDecrementUnderflow() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.decrement();
    }

### Installing Library
##### 1. using CLI
     forge install library-name
     forge update library-name
     forge remove library-name

##### 2. remappings
     forge remappings
###### install`npm i @openzeppelin/contracts` and create remappings.txt and paste the following in remappings.txt
    @openzeppelin/=node_modules/@openzeppelin

    ---

    // SPDX-License-Identifier: UNLICENSED
    pragma solidity ^0.8.13;

    import "@openzeppelin/contracts/access/Ownable.sol";

    contract OpenzTest is Ownable {
        constructor(address initialOwner) Ownable(initialOwner) {}
    }

### Format code
##### run `forge fmt`