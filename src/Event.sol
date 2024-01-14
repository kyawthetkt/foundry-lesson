// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Event {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function transfer(address _from, address _to, uint256 _amount) external {
        emit Transfer(_from, _to, _amount);
    }

    function transferMany(address _from, address[] calldata _tos, uint256[] calldata _amounts) external {
        for (uint256 i = 0; i < _tos.length; i++) {
            emit Transfer(_from, _tos[i], _amounts[i]);
        }
    }
}
