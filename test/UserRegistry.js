const { ethers } = require('hardhat');
const { expect } = require('chai');

describe("UserRegistry", function() {
  let UserRegistry;
  let userRegistry;
  let owner;

  beforeEach(async function () {
    [owner] = await ethers.getSigners();

    UserRegistry = await ethers.getContractFactory('UserRegistry');
    userRegistry = await UserRegistry.deploy();
    await userRegistry.deployed();
  });

  it('Should register a new user', async function () {
    const name = 'John Doe';
    const whatsapp = '123456789';
    await userRegistry.connect(owner).register(name, whatsapp);
    const user = await userRegistry.getUser(owner.address);
    expect(JSON.stringify(user)).to.be.equal(JSON.stringify([name, whatsapp]));
  });

  it('should emit UserRegistered event with correct parameters', async function () {
    const name = 'Alice';
    const whatsapp = '+1234567890';
  
    const tx = await userRegistry.connect(owner).register(name, whatsapp);
    const receipt = await tx.wait();
  
    expect(receipt.events[0].event).to.equal('UserRegistered');
    expect(receipt.events[0].args.userAddress).to.equal(await owner.getAddress());
    expect(receipt.events[0].args.name).to.equal(name);
    expect(receipt.events[0].args.whatsapp).to.equal(whatsapp);
  });
  

  it("should not register a user with empty name", async function() {
    const name = "";
    const whatsapp = "1234567890";

    await expect(userRegistry.register(name, whatsapp)).to.be.revertedWith("Name cannot be empty");
  });

  it("should not register a user with empty whatsapp", async function() {
    const name = "John Doe";
    const whatsapp = "";

    await expect(userRegistry.register(name, whatsapp)).to.be.revertedWith("Whatsapp cannot be empty");
  });

  it("should get a user", async function() {
    const name = "John Doe";
    const whatsapp = "1234567890";

    await userRegistry.register(name, whatsapp);

    const userAddress = await owner.getAddress();
    const user = await userRegistry.getUser(owner.address);
    expect(user[0]).to.equal(name);
    expect(user[1]).to.equal(whatsapp);
  });

  it("should not get a user that does not exist", async function() {
    const userAddress = ethers.utils.getAddress("0x0000000000000000000000000000000000000000");

    await expect(userRegistry.getUser(userAddress)).to.be.revertedWith("User not found");
  });

  it('should register and retrieve multiple users', async function () {
    const [user1, user2, user3] = await ethers.getSigners();
    
    await userRegistry.connect(user1).register('Alice', '+1234567890');
    await userRegistry.connect(user2).register('Bob', '+2345678901');
    await userRegistry.connect(user3).register('Charlie', '+3456789012');
  
    const [name1, whatsapp1] = await userRegistry.getUser(user1.address);
    const [name2, whatsapp2] = await userRegistry.getUser(user2.address);
    const [name3, whatsapp3] = await userRegistry.getUser(user3.address);
  
    expect(name1).to.equal('Alice');
    expect(whatsapp1).to.equal('+1234567890');
    expect(name2).to.equal('Bob');
    expect(whatsapp2).to.equal('+2345678901');
    expect(name3).to.equal('Charlie');
    expect(whatsapp3).to.equal('+3456789012');
  });
});
