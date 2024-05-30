// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// For this project, you will write a smart contract to create your own ERC20 token and deploy it using HardHat or Remix. 
// Once deployed, you should be able to interact with it for your walk-through video. From your chosen tool, 
// the contract owner should be able to mint tokens to a provided address and any user should be able to burn and transfer tokens.

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

    // Mint function to allow the owner to mint new tokens
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Burn function to allow any user to burn their tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
