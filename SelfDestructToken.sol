// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * Token yang bisa self-destruct kalau supply tinggal sedikit.
 * Cocok untuk projek iseng dengan ending apokaliptik.
 */

contract SelfDestructToken {
    string public name = "Last Token";
    string public symbol = "LST";
    uint8 public decimals = 0;
    uint256 public totalSupply = 77;

    mapping(address => uint256) public balanceOf;
    address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Warning(string message);

    constructor() {
        owner = msg.sender;
        balanceOf[owner] = totalSupply;
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Not enough tokens!");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        totalSupply -= value;

        emit Transfer(msg.sender, to, value);

        if (totalSupply <= 7) {
            emit Warning("⚠️ Token hampir punah. Sistem akan dihancurkan.");
            selfDestruct();
        }
        return true;
    }

    function selfDestruct() internal {
        selfdestruct(payable(owner));
    }
}