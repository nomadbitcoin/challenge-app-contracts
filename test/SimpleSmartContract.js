const { expect } = require("chai");
const hre = require("hardhat");

describe("SimpleSmartContract", function () {
  async function deploySimpleSmartContract() {
    const SimpleSmartContract = await hre.ethers.getContractFactory("SimpleSmartContract");
    const simpleSmartContract = await SimpleSmartContract.deploy();
  
    await simpleSmartContract.deployed();
  
    console.log(
      `Contract deployed to ${simpleSmartContract.address}`
    );
    return simpleSmartContract.address
  }

  describe("Deployment", function () {});
    it("Should set the right unlockTime", async function () {
      const deploymentAddress = await deploySimpleSmartContract();

      expect(deploymentAddress).to.contain("0x")
    });
});
