pragma solidity ^0.4.23;

contract Mortal {
    /* Define variable owner of the type address */
    address owner;

    /* This function is executed at initialization and sets the owner of the contract */
    constructor() public { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() public {
        if (msg.sender == owner) 
            selfdestruct(owner); 
    }
}

contract SingleGreeter is Mortal {
    /* Define variable greeting of the type string */
    string greeting;
    bool initialized = false;

    /* This runs when the contract is executed */
    constructor() public {
    }

    /* change greeting */
    function changeGreeting(string _greeting) public {
        if (!initialized) {
            greeting = _greeting;
            initialized = true;
        } else {
            revert();
        }
    }
    
    /* Main function */
    function greet() public view returns (string) {
        return greeting;
    }
}
