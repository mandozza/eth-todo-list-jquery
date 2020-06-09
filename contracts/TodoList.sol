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
    // Creates an event to notify something has happened.
    event TaskCreated(
        uint id,
        string content,
        bool completed
    );
    //Creates an event to notify task boolean has changed.
    event TaskCompleted(
        uint id,
        bool completed
    );

    // Runs on deploy
    constructor() public {
        createTask("Create more Tasks!!");
    }

    // Creates tasks to go into mapping.
    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
        // Kicks off an event.
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        // create the variable in memory (_ means its a local variable)
        Task memory _task = tasks[_id];
        // flip  the bool
        _task.completed = !_task.completed;
        // put it back into the mapping.
        tasks[_id] = _task;
        // Emit event that it was completed.
        emit TaskCompleted(_id, _task.completed);
    }
}