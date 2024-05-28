// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimplePayment {
    address payable public owner;
    event PaymentReceived(address indexed from, uint256 amount);

    constructor() {
        owner = payable(msg.sender);
    }

    function pay() external payable {
        require(msg.value > 0, "You need to send some Ether");

        emit PaymentReceived(msg.sender, msg.value);
    }

    function withdraw(uint amount) external {
        require(msg.sender == owner, "Only the owner can withdraw");
        uint256 balance = address(this).balance;
        require(balance > 0, "No Ether to withdraw");

        owner.transfer(amount);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
