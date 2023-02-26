const { ethers } = require('hardhat');
const fs = require('fs');

const contractAddress = '0xd1be7ff959fE7Bc8E45F4432546C9D387C3836f4';


async function main() {
  const [account] = await ethers.getSigners();
  const contractName = 'UserRegistry';
  const contractArtifactsPath = `artifacts/contracts/${contractName}.sol/${contractName}.json`;
  const contractArtifacts = JSON.parse(fs.readFileSync(contractArtifactsPath).toString());
  const abi = contractArtifacts.abi;

  const userRegistry = new ethers.Contract(contractAddress, abi, account);

  const name = 'Yan';
  const whatsapp = '+55339';

  const tx = await userRegistry.register(name, whatsapp);
  await tx.wait();

  console.log('User registered successfully!');
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
