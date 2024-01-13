
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
