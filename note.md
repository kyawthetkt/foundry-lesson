
# gas-report
forge test --match-path test/Counter.t.sol --gas-report

# vm.expectRevert
``
function testDecrementUnderflow() public {
    vm.expectRevert(stdError.arithmeticError);
    counter.decrement();
}
``