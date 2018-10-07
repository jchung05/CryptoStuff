pragma solidity ^0.4.24;

library SafeMath {
    function add(uint a, uint b) public pure returns(uint c) {
        if (a == 0) {
            return b;
        } else if (b == 0) {
            return a;
        }
        c = a + b;
        require(c >= a && c >= b);
    }
    
    function sub(uint a, uint b) public pure returns(uint c) {
        require(b <= a);
	c = a - b;
    }
    
    function mult(uint a, uint b) public pure returns(uint c) {
        if (a == 0 || b == 0) {
            return 0;
        }
	c = a * b;
        require(c / a == b);
    }
    
    function div(uint a, uint b) public pure returns(uint) {
        require(b != 0);
        return a / b;
    }
    
    function mod(uint a, uint b) public pure returns(uint) {
        require(b != 0);
        return a % b;
    }
}
