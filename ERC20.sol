pragma solidity ^0.4.24;

contract ERC20 {

	//4 necessary class variables here
	string name;
    address owner;
    uint totalmint;
    mapping(address => uint) accounts;

	//Constructor goes here
    constructor(uint coins, string coinName) public {
    	name = coinName;
        owner = msg.sender;
        totalmint = coins;
	accounts[owner] = totalmint;
    }
	

	//function modifier onlyOwner goes here
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

	//withdrawalEth function goes here
	function withdrawalEth() onlyOwner public payable {
	    owner.transfer(address(this).balance);
	}


	//Transfer token function
	function transfer(address recipient, uint tokens) public {
	    //Check that sender has enough tokens to send
	    require(accounts[msg.sender] >= tokens);
	    accounts[msg.sender] -= tokens;
	    accounts[recipient] += tokens;
	}


	//ICO Sale function
	//Make sure to specify how many tokens you get per eth
	//Assuming that 100 finney = 1 joeytoken
	function sale() public payable {
		require(msg.value > 100 finney);
		require(accounts[owner] >= 0);
		
		uint numTokens = msg.value / 100 finney;
		uint leftover = msg.value - (numTokens * 100 finney);

		msg.sender.transfer(leftover);
		accounts[owner] -= numTokens;
		accounts[msg.sender] += numTokens;
	}


	//function that returns you the amount of coins a certain address has
    function getAmount(address addr) public view returns(uint) {
        return accounts[addr];
    }
}

