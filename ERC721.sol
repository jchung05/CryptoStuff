pragma solidity ^0.4.24;

contract ERC721 {
    uint totalmint;
    uint current;
    string name;
    address owner;
    mapping(uint => address) assets;
    
    constructor(string tName, uint total) public {
        name = tName;
        totalmint = total;
        owner = msg.sender;
        current = 0;
    }
    
    function changeOwner(uint tId, address recipient) public {
        require(assets[tId] == msg.sender);
        assets[tId] = recipient;
    }
    
    function withdrawal() payable public {
        owner.transfer(address(this).balance);
    }
    
    function sale() payable public {
        require(msg.value == 100 finney);
        require(current < totalmint);
        
        assets[current++] = msg.sender;
    }
}
