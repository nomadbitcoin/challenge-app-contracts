require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();
require("hardhat-jest-plugin");

const { WALLET_PRIVATE_KEY } = process.env;
const { POLYGONSCAN_API_KEY } = process.env;
const { TESTNET_ALCHEMY_URL } = process.env;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    mumbai: {
      url: TESTNET_ALCHEMY_URL,
      accounts: [`0x${WALLET_PRIVATE_KEY}`],
    },
    localhost: {
      url: process.env.LOCALHOST_URL || '',
      accounts:
        process.env.WALLET_PRIVATE_KEY !== undefined
          ? [process.env.WALLET_PRIVATE_KEY]
          : [],
    },
  },
  etherscan: {
    apiKey: POLYGONSCAN_API_KEY,
  },
};