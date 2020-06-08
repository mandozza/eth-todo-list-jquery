pragma solidity  ^0.5.0;

contract TodoList {
    // Defines the number of Tasks.
    uint public taskCount = 0;

    // Defines the structure of Data for a task.
    struct Task {
        uint id;
        string content;
        bool completed;
    }
    //Sets up basically an array to hold all the data.
    mapping(uint => Task) public tasks;

    // Runs on deploy
    constructor() public {
        createTask("Create more Tasks!!");
    }

    // Creates tasks to go into mapping.
    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);

    }
}