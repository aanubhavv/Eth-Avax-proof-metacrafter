// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

//import "hardhat/console.sol";

contract Assessment {
    address payable public owner;
    uint256 public balance;
    uint256 public stakedBalance;

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    event Stake(uint256 amount);
    event Unstake(uint256 amount);

    constructor(uint initBalance, uint initStakedBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;
        stakedBalance = initStakedBalance;
    }

    function getBalance() public view returns(uint256){
        return balance;
    }
    function getstakedBalance() public view returns(uint256){
        return stakedBalance;
    }

    function deposit(uint256 _amount) public payable {
        uint _previousBalance = balance;

        // make sure this is the owner
        require(msg.sender == owner, "You are not the owner of this account");

        // perform transaction
        balance += _amount;

        // assert transaction completed successfully
        assert(balance == _previousBalance + _amount);

        // emit the event
        emit Deposit(_amount);
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }

        // withdraw the given amount
        balance -= _withdrawAmount;

        // assert the balance is correct
        assert(balance == (_previousBalance - _withdrawAmount));

        // emit the event
        emit Withdraw(_withdrawAmount);
    }

    function stake(uint256 _amount) public {
        require(_amount > 0, "Staked amount must be greater than 0");
        require(balance >= _amount, "Insufficient balance to stake");

        uint _previousBalance = balance;

        balance -= _amount;
        stakedBalance += _amount;

        assert(balance == (_previousBalance - _amount));

        emit Stake(_amount);
    }

    function unstake(uint256 _amount) public {
        require(_amount > 0, "Unstaked amount must be greater than 0");
        require(stakedBalance >= _amount, "Insufficient staked balance to unstake");

        uint _previousBalance = balance;

        stakedBalance -= _amount;
        balance += _amount;

        assert(balance == (_previousBalance + _amount));

        emit Unstake(_amount);
    }
}
