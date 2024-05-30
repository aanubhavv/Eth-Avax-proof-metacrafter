# Creating and deplying token using ERC20

## Simple overview of use/purpose.

This contract is an ERC20-compliant token built on the Ethereum blockchain. This token allows the owner to mint new tokens to any specified address. Additionally, any user can burn and transfer tokens, enabling a flexible and decentralized token economy.

## Description

MyToken is a customizable ERC20 token implemented using OpenZeppelin's ERC20 and Ownable contracts. The smart contract allows the owner to mint new tokens to any address, while any token holder can burn their tokens, providing a simple and secure way to manage token supply. The contract is designed to be deployed using tools like HardHat or Remix.

## Getting Started

### Installing

#### How/where to download your program

You can download the project source code from the GitHub repository: [MyToken GitHub Repository](https://github.com/aanubhavv/Eth-Avax-proof-metacrafter/new/main/module-3-assessment).

#### Any modifications needed to be made to files/folders

No specific modifications are needed. Ensure you have the correct versions of the dependencies specified in the `import` statements.

### Executing program

#### How to run the program

1. **Clone the repository:**

    ```bash
    git clone https://github.com/your-repo-link
    cd mytoken
    ```

2. **Install dependencies:**

    If using HardHat:

    ```bash
    npm install
    ```

3. **Deploy the contract:**

    Create a new deployment script (e.g., `deploy.js`) in the `scripts` folder:

    ```javascript
    const hre = require("hardhat");

    async function main() {
        const MyToken = await hre.ethers.getContractFactory("MyToken");
        const myToken = await MyToken.deploy("MyToken", "MTK");

        await myToken.deployed();

        console.log("MyToken deployed to:", myToken.address);
    }

    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
    });
    ```

    Then run the deployment script:

    ```bash
    npx hardhat run scripts/deploy.js --network <network-name>
    ```

4. **Interact with the contract:**

    Use HardHat console or Remix to interact with the deployed contract. Example commands:

    ```javascript
    // Minting tokens
    await myToken.mint("0xAddress", 1000);

    // Burning tokens
    await myToken.burn(500);
    ```

### Help

Any advice for common problems or issues.

- Ensure your development environment is correctly set up with Node.js and HardHat.
- Verify the contract address after deployment and use the correct address for interactions.
- Check the Ethereum network configuration in HardHat or Remix settings.

#### Command to run if the program contains helper info

To display help information:

```bash
npx hardhat help
```
