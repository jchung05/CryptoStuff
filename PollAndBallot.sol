pragma solidity ^0.4.24;

contract Ballot {
    bool party;
    
    constructor(bool TorF) public {
        party = TorF;
    }
    
    function getVote() view public returns(bool) {
        return party;
    }
}

contract Poll {
    mapping(address => bool) polled;
    Ballot[] poll;
    
    mapping(string => uint) votes;
    
    function create_ballot(bool A) public {
        require(polled[msg.sender] == false);
        polled[msg.sender] = true;
        
        poll.push(new Ballot(A));
    }
    
    function tally() public returns(string) {
        for (uint i = 0; i < poll.length; i++) {
            if (poll[i].getVote()) {
                votes["partyA"]++;
            } else {
                votes["partyB"]++;
            }
        }
        return  votes["partyA"] > votes["partyB"] ? "partyA" : 
                votes["partyA"] < votes["partyB"] ? "partyB" : "tie";
    }
}
