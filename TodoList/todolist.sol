// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedTodoList {
    // Define a struct for each task
    struct Task {
        string description;
        bool isCompleted;
    }

    // Mapping from user address to their list of tasks
    mapping(address => Task[]) private userTasks;

    // Event emitted when a task is added
    event TaskAdded(address indexed user, uint256 taskId, string description);

    // Event emitted when a task is completed
    event TaskCompleted(address indexed user, uint256 taskId);

    // Event emitted when a task is deleted
    event TaskDeleted(address indexed user, uint256 taskId);

    // Function to add a new task
    function addTask(string memory _description) public {
        uint256 taskId = userTasks[msg.sender].length;
        userTasks[msg.sender].push(Task({description: _description, isCompleted: false}));
        emit TaskAdded(msg.sender, taskId, _description);
    }

    // Function to get the number of tasks for the caller
    function getTaskCount() public view returns (uint256) {
        return userTasks[msg.sender].length;
    }

    // Function to get details of a specific task by index
    function getTask(uint256 _index) public view returns (string memory description, bool isCompleted) {
        require(_index < userTasks[msg.sender].length, "Task index out of bounds");
        Task memory task = userTasks[msg.sender][_index];
        return (task.description, task.isCompleted);
    }

    // Function to mark a task as completed
    function completeTask(uint256 _index) public {
        require(_index < userTasks[msg.sender].length, "Task index out of bounds");
        userTasks[msg.sender][_index].isCompleted = true;
        emit TaskCompleted(msg.sender, _index);
    }

    // Function to delete a task (swap with last and pop to avoid gaps)
    function deleteTask(uint256 _index) public {
        require(_index < userTasks[msg.sender].length, "Task index out of bounds");
        uint256 lastIndex = userTasks[msg.sender].length - 1;
        if (_index != lastIndex) {
            userTasks[msg.sender][_index] = userTasks[msg.sender][lastIndex];
        }
        userTasks[msg.sender].pop();
        emit TaskDeleted(msg.sender, _index);
    }
}