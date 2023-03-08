// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ChallengeNFT is ERC1155, Ownable {
    uint256 constant CHALLENGE_PERIOD = 21 days;

    struct Task {
        uint256 id;
        string name;
        bool completed;
    }

    struct TaskProgress {
        uint256 timestamp;
        Task task;
    }

    mapping(address => mapping(uint => mapping(uint256 => TaskProgress))) participantProgress; // maps the user address to challenge ID to a taskStatus history as progress counter.

    struct Challenge {
        uint256 id;
        string name;
        string image;
        uint256 startTime;
        uint256 endTime;
        address[] participants;
        uint256[] taskIds;
        uint256 challengeDeposit;
    }


    IERC20 public usdcToken; // USDC token contract reference
    
    Challenge[] public challenges;
    uint256 public taskCount;

    mapping(uint256 => Task) public tasks;
    mapping(address => mapping(uint256 => bool)) public participants; // maps user address to challenge ID to boolean indicating participation
    mapping(address => mapping(uint256 => bool)) public hasDeposited; // maps user address to challenge ID to boolean indicating whether they have deposited


    constructor(address _usdcTokenAddress) ERC1155("") {
        usdcToken = IERC20(_usdcTokenAddress); // sets the USDC token contract reference
    }
    function addChallenge(
        string memory _name,
        string memory _image,
        uint256 _startTime,
        uint256 _challengeDeposit
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
                taskIds: new uint[](0),
                challengeDeposit: _challengeDeposit
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


    function registerParticipant(uint256 _challengeId, uint256 _depositAmount) external {
        require(_challengeId < challenges.length, "Challenge ID does not exist");

        Challenge storage challenge = challenges[_challengeId];
        require(_depositAmount >= challenge.challengeDeposit, "Deposit amount is less than required");
        require(block.timestamp < challenge.startTime, "Challenge has already started");
        require(block.timestamp < challenge.endTime, "Challenge has already ended");

        if (!participants[msg.sender][_challengeId]) {
            participants[msg.sender][_challengeId] = true;
            challenge.participants.push(msg.sender);
            _mint(msg.sender, _challengeId, 1, "");

            if (!hasDeposited[msg.sender][_challengeId]) {
                hasDeposited[msg.sender][_challengeId] = true;
                usdcToken.transferFrom(msg.sender, address(this), _depositAmount); // transfers the deposit amount in USDC from the user to the contract
            }
        }
    }

    function withdrawRewards(uint256 _challengeId) external {
        Challenge storage challenge = challenges[_challengeId];
        require(block.timestamp > challenge.endTime, "Challenge has not ended yet");
        require(participants[msg.sender][_challengeId], "User did not participate in challenge");

        uint256 depositAmount = challenge.challengeDeposit;

        // Distribuindo o valor do depósito para todos os participantes
        for (uint256 i = 0; i < challenge.participants.length; i++) {
            address participant = challenge.participants[i];
            usdcToken.transfer(participant, depositAmount); // Transferindo os fundos USDC para o participante
        }
    }


    function getTasksForChallenge(uint256 _challengeId) external view returns (Task[] memory) {
        require(_challengeId < challenges.length, "Challenge ID does not exist");

        Challenge storage challenge = challenges[_challengeId];
        uint256 numTasks = challenge.taskIds.length;
        Task[] memory result = new Task[](numTasks);

        for (uint256 i = 0; i < numTasks; i++) {
            uint256 taskId = challenge.taskIds[i];
            result[i] = tasks[taskId];
        }

        return result;
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