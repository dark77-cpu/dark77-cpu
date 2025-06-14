// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * TokenNyinyir.sol
 * Token yang nyinyir tiap kali di-transfer.
 * Hanya untuk dev yang kuat mental.
 */

contract TokenNyinyir {
    string public name = "Token Nyinyir";
    string public symbol = "NYN";
    uint8 public decimals = 0;
    uint256 public totalSupply = 1000;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Nyinyir(string msg);

    constructor() {
        balanceOf[msg.sender] = totalSupply;
        emit Nyinyir("Congrats, lo jadi juragan token nyinyir.");
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Miskin detected!");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        if (value == 1) {
            emit Nyinyir("Cuma ngasih 1? Pelit amat bang.");
        } else if (value > 100) {
            emit Nyinyir("Gaya! Royal banget bos.");
        } else {
            emit Nyinyir("Transfer nyinyir sukses.");
        }
        return true;
    }
}