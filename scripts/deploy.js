const hre = require("hardhat");

async function main() {
  
  const SimpleSmartContract = await hre.ethers.getContractFactory("SimpleSmartContract");
  const simpleSmartContract = await SimpleSmartContract.deploy();

  await simpleSmartContract.deployed();

  console.log(
    `Contract deployed to ${simpleSmartContract.address}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
