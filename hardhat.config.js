require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();
require("./tasks/sample_tasks");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      chainId: 1337
    }
  }
};