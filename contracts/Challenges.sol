// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ChallengeNFT is ERC1155, Ownable {
    uint256 constant CHALLENGE_PERIOD = 21 days;

    struct Task {
        uint256 id;
        string name;
        bool completed;
    }

    struct Challenge {
        uint256 id;
        string name;
        string image;
        uint256 startTime;
        uint256 endTime;
        address[] participants;
        uint256[] taskIds;
    }

    Challenge[] public challenges;
    mapping(uint256 => Task) public tasks;
    uint256 public taskCount;
    mapping(address => mapping(uint256 => bool)) public participants; // maps user address to challenge ID to boolean indicating participation

    constructor() ERC1155("") {}

    function addChallenge(
        string memory _name,
        string memory _image,
        uint256 _startTime
    ) external onlyOwner returns (uint256) {
        uint256 challengeId = challenges.length;

        challenges.push(
            Challenge({
                id: challengeId,
                name: _name,
                image: _image,
                startTime: _startTime,
                endTime: _startTime + CHALLENGE_PERIOD,
                participants: new address[](0),
                taskIds: new uint[](0)
            })
        );

        return challengeId;
    }

    function addTask(string memory _taskName) external onlyOwner returns (uint256) {
        uint256 taskId = taskCount;
        tasks[taskId] = Task({
            id: taskId,
            name: _taskName,
            completed: false
        });
        taskCount++;
        return taskId;
    }

    function addTaskToChallenge(uint256 _challengeId, uint256 _taskId) external onlyOwner {
        require(_challengeId < challenges.length, "Challenge ID does not exist");
        require(_taskId < taskCount, "Task ID does not exist");

        Challenge storage challenge = challenges[_challengeId];
        challenge.taskIds.push(_taskId);
    }


    function registerParticipant(uint256 _challengeId) external {
        require(
            _challengeId < challenges.length,
            "Challenge ID does not exist"
        );

        Challenge storage challenge = challenges[_challengeId];
        require(
            block.timestamp < challenge.startTime,
            "Challenge has already started"
        );
        require(
            block.timestamp < challenge.endTime,
            "Challenge has already ended"
        );

        if (!participants[msg.sender][_challengeId]) {
            participants[msg.sender][_challengeId] = true;
            challenge.participants.push(msg.sender);
            _mint(msg.sender, _challengeId, 1, "");
        }
    }


    function getChallengesForAddress(address _address)
        external
        view
        returns (uint256[] memory)
    {
        uint256[] memory result = new uint256[](challenges.length);
        uint256 counter = 0;

        for (uint256 i = 0; i < challenges.length; i++) {
            if (participants[_address][i]) {
                result[counter] = challenges[i].id;
                counter++;
            }
        }

        uint256[] memory finalResult = new uint256[](counter);
        for (uint256 i = 0; i < counter; i++) {
            finalResult[i] = result[i];
        }

        return finalResult;
    }
}