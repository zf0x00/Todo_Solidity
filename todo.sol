// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Todo {
    struct TodoLists {
        uint256 id;
        string data;
        bool isCompleted;
        address owner;
    }
    uint256 noteid = 0;

    TodoLists[] todolist;

    //Override put function
    function put(string memory _data, bool _isCompleted)
        public
        returns (bool success)
    {
        TodoLists memory todolists;
        todolists.id = noteid;
        todolists.data = _data;
        todolists.isCompleted = _isCompleted;
        todolists.owner = msg.sender;
        todolist.push(todolists);
        noteid++;
        // emit Added(todolists.id, _data, _isCompleted, todolists.owner);
        return true;
    }

    function get(uint256 _index) public view returns (TodoLists memory) {
        require(
            todolist[_index].owner == msg.sender,
            "Only Owner can access the data"
        );
        return todolist[_index];
    }

    function markComplete(uint _index) public returns(bool){
        TodoLists storage todolis = todolist[_index];
        todolis.isCompleted = !todolis.isCompleted;
        return true;
    }
}
