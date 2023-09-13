// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Privacy {

  // данные хранятся в слотах по 32 байта
  bool public locked = true; // слот 0 (32 байта)
  uint256 public ID = block.timestamp; // слот 1 (32 байта)
  uint8 private flattening = 10; // слот 2 (8+8+16 = 32 байта)
  uint8 private denomination = 255; // слот 2
  uint16 private awkwardness = uint16(block.timestamp); // слот 2
  bytes32[3] private data; // слот 3, 4, 5

  constructor(bytes32[3] memory _data) {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
 // https://medium.com/@dariusdev/how-to-read-ethereum-contract-storage-44252c8af925
}