// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract UniqueLoyaltyToken is ERC20 {
    address public admin;

    constructor() ERC20("Unique Reward Token", "URT") {
        admin = msg.sender;
        _mint(msg.sender, 1000000 * 10 ** decimals()); // 1 Million tokens mint honge
    }

    // Unique Feature: Transfer ke waqt 1% burn hoga
    function transfer(address to, uint256 amount) public override returns (bool) {
        uint256 burnAmount = amount / 100; // 1% calculate
        uint256 sendAmount = amount - burnAmount;
        
        _burn(_msgSender(), burnAmount);
        return super.transfer(to, sendAmount);
    }
}
