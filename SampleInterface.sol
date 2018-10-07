pragma solidity ^0.4.24;

interface prototype {

	//Create function prototype for setVar right here
	function setVar(uint a, uint b) external;
    
}

contract addVar is prototype {
   
   uint256 public sum;
   
   function setVar(uint256 a, uint256 b) public 
   {
       sum = a + b;
   }
   
}
