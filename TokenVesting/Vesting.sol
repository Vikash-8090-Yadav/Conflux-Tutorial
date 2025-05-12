
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.3/token/ERC20/IERC20.sol";

contract TokenLockVault {
    IERC20 public vestingToken;
    address public beneficiary;
    uint256 public lockedAmount;
    uint256 public unlockTime;

    bool public isLocked = false;
    bool public isWithdrawn = false;

    event TokensDeposited(address indexed depositor, address indexed beneficiary, uint256 amount, uint256 unlockTime);
    event TokensClaimed(address indexed beneficiary, uint256 amount);

    constructor(address _tokenAddress) {
        vestingToken = IERC20(_tokenAddress);
    }

    function depositTokens(address _depositor, address _beneficiary, uint256 _amount, uint256 _unlockTime) external {
        require(!isLocked, "Tokens already locked.");
        require(_amount > 0, "Amount must be greater than zero.");
        require(_unlockTime > block.timestamp, "Unlock time must be in the future.");

        vestingToken.transferFrom(_depositor, address(this), _amount);
        beneficiary = _beneficiary;
        lockedAmount = _amount;
        unlockTime = _unlockTime;
        isLocked = true;

        emit TokensDeposited(_depositor, _beneficiary, _amount, _unlockTime);
    }

    function claimTokens() external {
        require(isLocked, "No tokens locked.");
        require(block.timestamp >= unlockTime, "Tokens are still locked.");
        require(!isWithdrawn, "Tokens already claimed.");
        require(msg.sender == beneficiary, "Only beneficiary can claim.");

        isWithdrawn = true;
        vestingToken.transfer(beneficiary, lockedAmount);

        emit TokensClaimed(beneficiary, lockedAmount);
    }

    function currentTime() external view returns (uint256) {
        return block.timestamp;
    }
}
