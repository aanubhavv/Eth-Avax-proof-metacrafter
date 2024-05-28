// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// For this challenge, write a smart contract that uses view, pure, and payable functions. 
// Ensure that the functions are accessible within the contract and derived contracts as well.

contract functionTypes {
    uint x = 10;
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function addToX(uint y) public view returns(uint) {
        return x + y;
    }

    function add(uint X, uint y) public pure returns(uint) {
        return X + y;
    }

    function deposit() external payable {}

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
