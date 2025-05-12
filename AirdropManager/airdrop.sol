// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract AirdropManager is Ownable {
    IERC20 public token;
    mapping(address => uint256) public airdropAmounts;
    mapping(address => bool) public hasClaimed;

    event AirdropSet(address indexed recipient, uint256 amount);
    event AirdropClaimed(address indexed recipient, uint256 amount);

    constructor(address _token) Ownable(msg.sender) {
        token = IERC20(_token);
    }

    function setAirdrops(address[] calldata recipients, uint256[] calldata amounts) external onlyOwner {
        require(recipients.length == amounts.length, "Length mismatch");

        for (uint256 i = 0; i < recipients.length; i++) {
            airdropAmounts[recipients[i]] = amounts[i];
            emit AirdropSet(recipients[i], amounts[i]);
        }
    }

    function claim() external {
        require(!hasClaimed[msg.sender], "Already claimed");
        uint256 amount = airdropAmounts[msg.sender];
        require(amount > 0, "No airdrop set");

        hasClaimed[msg.sender] = true;
        require(token.transfer(msg.sender, amount), "Token transfer failed");

        emit AirdropClaimed(msg.sender, amount);
    }

    function recoverUnclaimedTokens() external onlyOwner {
        uint256 balance = token.balanceOf(address(this));
        token.transfer(owner(), balance);
    }
}
