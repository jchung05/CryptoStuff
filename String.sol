pragma solidity ^0.4.24;

contract String {
    using strings for *;
    string public s;
    
    function strlen(s1 string) public returns(uint) {
        return byte(s1).length;
    }
    
    function strcmp(s1 string, s2 string) public returns(bool) {
        return keccak256(s1) == keccak256(s2);
    }
    
    function strjoin(s1 string, s2 string) public returns(string) {
        return abi.encodePacked(s1,s2);
    }
    
    function strupper(s1 string) public returns(string) {
        for (uint i = 0; i < bytes(s1).length; i++) {
            if (s1[i] >= 65 && s1[i] <= 90) {
                s1[i] += 32;
            }
        }
        return s1;
    }
    
    function strlower(s1 string) public returns(string) {
        for (uint i = 0; i < bytes(s1).length; i++) {
            if (s1[i] >= 97 && s1[i] <= 122) {
                s1[i] -= 32;
            }
        }
        return s1;
    }
}
