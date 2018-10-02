pragma solidity ^0.4.24;

contract ERC20 {

	//4 necessary class variables here
    address owner;
    uint amount;

	//Constructor goes here
    constructor(uint coins) public {
        owner = msg.sender;
        amount = coins;
    }
	

	//function modifier onlyOwner goes here
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

	//withdrawalEth function goes here
	function withdrawalEth() onlyOwner public payable {
	    
	}


	//Transfer token function
	function transfer() public pure {
	    
	}


	//ICO Sale function
	//Make sure to specify how many tokens you get per eth
    function sale() public payable {
        
    }


	//function that returns you the amount of coins a certain address has
    function getAmount() public view returns(uint) {
        return amount;
    }
}

