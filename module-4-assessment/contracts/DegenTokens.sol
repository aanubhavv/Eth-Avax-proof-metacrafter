// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    struct InventoryItem {
        string name;
        uint256 amount;
    }

    mapping(address => mapping(uint256 => InventoryItem)) public playerItems;
    mapping(address => uint256[]) public playerItemIds;

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
        _transfer(_msgSender(), to, amount);
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
        require(balanceOf(msg.sender) >= item.price * 10 ** decimals(), "Insufficient tokens");

        _burn(msg.sender, item.price * 10 ** decimals());

        InventoryItem storage inventoryItem = playerItems[msg.sender][itemId - 1];
        if (bytes(inventoryItem.name).length == 0) {
            inventoryItem.name = item.name;
            playerItemIds[msg.sender].push(itemId - 1);
        }
        inventoryItem.amount += 1;
    }

    function shopItems() external view returns (ShopItem[] memory) {
        return shop;
    }

    function getPlayerInventory(address player) external view returns (InventoryItem[] memory) {
        uint256[] storage itemIds = playerItemIds[player];
        InventoryItem[] memory inventory = new InventoryItem[](itemIds.length);
        for (uint256 i = 0; i < itemIds.length; i++) {
            uint256 itemId = itemIds[i];
            inventory[i] = playerItems[player][itemId];
        }
        return inventory;
    }
}
