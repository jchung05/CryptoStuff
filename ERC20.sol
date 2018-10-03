pragma solidity ^0.4.24;

contract ERC20 {

	//4 necessary class variables here
	string name;
    address owner;
    uint amount;
    mapping(address => uint) accounts;

	//Constructor goes here
    constructor(uint coins, string coinName) public {
    	name = coinName;
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
	    owner.transfer(amount);
	}


	//Transfer token function
	function transfer(address recipient, uint tokens) public returns(bool success) {
	    accounts[msg.sender] -= tokens;
	    accounts[recipient] += tokens;
	    return (true);
	}


	//ICO Sale function
	//Make sure to specify how many tokens you get per eth
    function sale() public payable {
        
    }


	//function that returns you the amount of coins a certain address has
    function getAmount(address addr) public view returns(uint) {
        return accounts[addr];
    }
}

