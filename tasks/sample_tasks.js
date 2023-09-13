const { BigNumber } = require('ethers');
const { task, types } = require('hardhat/config');

function getFunctionSeletor(funcHead) {
  return ethers.utils.id(funcHead).slice(0,10)
}

function getEventSelector(eventHead) {
  return ethers.utils.id(eventHead)
}

async function getSloteAt(addr, slot) {
  return await ethers.provider.getStorageAt(addr, slot);
}

task("HackPrivacy", "HackPrivacy")
  .setAction(async (taskArgs, { ethers }) => {
    let bytes = await getSloteAt('0xbfcF39925051724C5d08304765FeCe609De1d05f', 5);
    let key = '0x' + bytes.slice(2, 34);
    console.log(key);
  });