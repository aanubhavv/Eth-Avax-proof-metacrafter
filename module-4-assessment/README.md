# Creating and deploying on the Avax C-chain

Creating and deplying DegenToken on the Avax C-chain for Degen Gaming.

## The contract was verified on the Avalanche fuji (testnet) C-Chain
![image](https://github.com/aanubhavv/Eth-Avax-proof-metacrafter/assets/117589083/ac118720-7d50-4a81-bdce-ecfbdc8b91fb)

[link to verification](https://testnet.snowtrace.io/address/0xBba74Bb36EddCc16d87eE1389c6f672207FF8076#code)

## Getting Started

### Installing

  1. Clone the [repository](https://github.com/aanubhavv/Eth-Avax-proof-metacrafter) using `git clone https://github.com/aanubhavv/Eth-Avax-proof-metacrafter.git`
  2. Move to the project directory using `cd module-4-assessment`
  3. Copy your Wallet's private key that contains [AVAX faucet tokens](https://core.app/tools/testnet-faucet/)
  4. Enter the key in `hardhat.config.js`

### Executing program

  1. Intall required dependencies using `npm i`
  2. Deploy on fuji chain (testnet for c-chain) using `npx hardhat run scripts/deploy.js --network fuji`
  3. Verify on snowtrace using `npx hardhat verify --network fuji YOUR_CONTRACT_ADDRESS`

Congratulations! you have successfully deployed the contract. Now use the contract address returned after deploying to check it on the [avalanche testnet block chain](https://testnet.snowtrace.io/).

Further functions provided can be tested on [Remix IDE](https://remix.ethereum.org/)







