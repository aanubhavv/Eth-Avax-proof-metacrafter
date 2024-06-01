# Creating and deploying on the Avax C-chain

Creating and deplying DegenToken on the Avax C-chain for Degen Gaming.

## Getting Started

### Installing

  1. Clone the [repository](https://github.com/aanubhavv/Eth-Avax-proof-metacrafter) using `git clone https://github.com/aanubhavv/Eth-Avax-proof-metacrafter`
  2. Move to the project directory using `cd module-4-assessment`
  3. Get your Wallet's private key with some AVAX faucet tokens on Fuji c-chain from [fuji faucet](https://core.app/tools/testnet-faucet/)
  4. Enter the key in `hardhat.config.js`

### Executing program

  1. intall required dependencies using `npm i`
  2. deploy on fuji chain (testnet for c-chain) using `npx hardhat run scripts/deploy.js --network fuji`

Congratulations! you have successfully deployed the contract. Now use the contract address returned after deploying to check it on the [avalanche testnet block chain](https://testnet.snowtrace.io/).

Further functions provided can be tested on [Remix IDE](https://remix.ethereum.org/)




