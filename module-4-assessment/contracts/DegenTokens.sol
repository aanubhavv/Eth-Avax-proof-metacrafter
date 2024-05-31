// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    mapping(address => uint256) public playerItems;

    struct ShopItem {
        string name;
        uint256 price;
    }

    ShopItem[] public shop;

    constructor() ERC20("DegenToken", "DGT") Ownable(msg.sender) {
        _mint(msg.sender, 100 * 10 ** decimals()); // Mint 100 tokens initially
        // Initialize shop with 4 items
        shop.push(ShopItem("Pants", 10));
        shop.push(ShopItem("Hat", 20));
        shop.push(ShopItem("Tshirt", 30));
        shop.push(ShopItem("Hoodie", 40));
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount * 10 ** decimals());
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount * 10 ** decimals());
        return true;
    }

    function burn(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount * 10 ** decimals(), "Insufficient balance");
        _burn(msg.sender, amount * 10 ** decimals());
    }

    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account) / 10 ** decimals();
    }

    function redeem(uint256 itemId) external {
        require(itemId - 1< shop.length, "Invalid item ID");
        ShopItem storage item = shop[itemId - 1];
        require(balanceOf(msg.sender) / 10 ** decimals() >= item.price, "Insufficient tokens");

        _burn(msg.sender, item.price * 10 ** decimals());
        playerItems[msg.sender] += 1; // Add 1 item to the player's inventory
    }

    function shopItems() external view returns (ShopItem[] memory) {
        return shop;
    }
}
