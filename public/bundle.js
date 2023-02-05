import { ethers } from "./ethers.js";
var contractABI = [];
var contractAddress = '0x5FbDB2315678afecb367f032d93F642f64180aa3';

const provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:8545/");
var simpleSmartContract = new ethers.Contract(contractAddress, contractABI, provider);

console.log(simpleSmartContract);

provider.listAccounts()
.then(console.log)
