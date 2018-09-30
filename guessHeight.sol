pragma solidity ^0.4.24;

contract guessHeight {

    uint8 private height;
    address public owner;
    
    constructor (uint8 _height) public payable
    {
        require(msg.value == 1 ether);
        owner = msg.sender;
        //set height here
        //require the contract to be sent 5 ether to create it
        height = _height;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function makeGuess(uint8 guess) public payable returns (string)
    {
        require(msg.value == 1 ether / 10);
        //if you guess the height correctly, you are sent 5 ether
        if (guess < height)
            return ("Guess less than height");
        else if (guess > height)
            return ("Guess greater than height");
        //withdrawalEth();
        msg.sender.transfer(1 ether);
        return ("Good job, that's the height");
    }
    
    function returnBalance () view public returns (uint256) {
        return address(this).balance;
    }
    
    function withdrawalEth() public onlyOwner payable
    {
        //withdraw ethereum from this contract to an external contract
        owner.transfer(address(this).balance);
    }

}
