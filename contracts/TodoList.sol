// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
    struct Task {
        uint id;
        string content;
        bool completed;
    }

    Task[] public tasks;

    function createTask(string memory _content) public {
        tasks.push(Task(tasks.length, _content, false));
    }

    function toggleCompleted(uint _taskId) public {
        Task memory task = tasks[_taskId];
        task.completed = !task.completed;
        tasks[_taskId] = task;
    }
}
