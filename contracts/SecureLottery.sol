// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @title SecureLottery
 * @dev An advanced lottery smart contract with security features
 * @notice PART 2 - Secure Lottery (MANDATORY)
 */
contract SecureLottery {
    
    address public owner;
    uint256 public lotteryId;
    uint256 public lotteryStartTime;
    bool public isPaused;
    uint256 public tractEntries;
    mapping(address => string) public playerInformation;
    uint256[] public pot;
    // TODO: Define additional state variables
    // Consider:
    // - How will you track entries?
    // - How will you store player information?
    // - What data structure for managing the pot?
    
    constructor() {
        owner = msg.sender;
        lotteryId = 1;
        lotteryStartTime = block.timestamp;
        isPaused = false;
        tractEntries = 1;
        //playerInformation = DefualtAdress;
        //pot = []; not sure how to set it up but I know it has to be an array
    }
    
    // TODO: Implement entry function
    // Requirements:
    // - Players pay minimum 0.01 ETH to enter
    // - Track each entry (not just unique addresses)
    // - Allow multiple entries per player
    // - Emit event with player address and entry count
    function enter() public payable {
    // while the player still chooses to enter(this will allow them to enter many times)
    // if the players information is not stored in the playerinformation list I will add it to it
    //if the player pays the minimum amount, I want to add their lotteryId to my pot
        // Your implementation here
        // Validation: Check minimum entry amount
        // Validation: Check if lottery is active
    }
    
    // TODO: Implement winner selection function
    function winner() public {
        //use a loop to go through the pot and choose a random index
        // fetch information from enter to find out who it was 
        // return the winners name 
    }
    // Requirements:
    // - Only owner can trigger
    // - Select winner from TOTAL entries (not unique players)
    // - Winner gets 90% of pot, owner gets 10% fee
    // - Use a secure random mechanism (better than block.timestamp)
    // - Require at least 3 unique players
    // - Require lottery has been active for 24 hours
    function selectWinner() public {
        // Your implementation here
        // CHALLENGE: How do you generate randomness securely?
        // Consider: blockhash, block.difficulty, etc.
    }
    
    // TODO: Implement circuit breaker (pause/unpause)
    // Requirements:
    // - Owner can pause lottery in emergency
    // - Owner can unpause lottery
    // - When paused, no entries allowed
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }
    
    modifier whenNotPaused() {
        require(!isPaused, "Contract is paused");
        _;
    }
    
    function pause() public onlyOwner {
        if (msg.sender == owner){
            isPaused = true;
        }
       // else {
        //     return "Only the owner can pause" ;
        // }
    }
    
    function unpause() public onlyOwner {
        if (msg.sender == owner){
            isPaused = false;
        }
    }
    
    // TODO: Implement reentrancy protection
    // CRITICAL: Prevent reentrancy attacks when sending ETH
    // Use checks-effects-interactions pattern
    
    // TODO: Helper/View functions
    // - Get current pot balance
    // - Get player entry count
    // - Check if lottery is active
    // - Get unique player count
    
    // BONUS: Add multiple prize tiers (1st, 2nd, 3rd place)
    // BONUS: Add refund mechanism if minimum players not reached
}
