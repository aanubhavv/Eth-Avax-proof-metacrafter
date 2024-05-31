// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// For this project, you will write a smart contract to create your own ERC20 token and deploy it using HardHat or Remix. 
// Once deployed, you should be able to interact with it for your walk-through video. From your chosen tool, 
// the contract owner should be able to mint tokens to a provided address and any user should be able to burn and transfer tokens.

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

//OpenZeppelin is an open-source framework that provides us with functionality to deploy tokens on blockchain

contract MyToken is ERC20, Ownable {
    constructor() ERC20("Warp", "WRP") {}

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address to, uint256 amount) external {
        require(to != address(0), "provide correct address");
        require(balanceOf(msg.sender) >= amount, "transfer amount exceeds balance");
        
        _transfer(msg.sender, to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

}
