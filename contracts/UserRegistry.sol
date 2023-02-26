// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract UserRegistry {
    struct User {
        string name;
        string whatsapp;
    }

    mapping(address => User) private users;

    event UserRegistered(address indexed userAddress, string name, string whatsapp);

    function register(string calldata _name, string calldata _whatsapp) external {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(bytes(_whatsapp).length > 0, "Whatsapp cannot be empty");

        User memory newUser = User(_name, _whatsapp);
        users[msg.sender] = newUser;

        emit UserRegistered(msg.sender, _name, _whatsapp);
    }

    function getUser(address _userAddress) external view returns (string memory, string memory) {
        User memory user = users[_userAddress];
        require(bytes(user.name).length > 0, "User not found");

        return (user.name, user.whatsapp);
    }
}
