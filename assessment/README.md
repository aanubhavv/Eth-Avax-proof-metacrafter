# Error examples! in Solidity


## Install

1. Install [Node.js](https://nodejs.org)

   Download and install from the official site.

2. Install [Truffle](https://github.com/trufflesuite/truffle)

   ```bash
   npm install -g truffle
   ```


## Initialize

1. Initialize Truffle in your project folder

   ```bash
   truffle init
   ```

   After initialization, you will find two folders called `contracts` and `migrations`. Contracts go in the `contracts` folder while contract deployment settings go in `migrations`.

2. The "ExampleContract" contract

   This is an example of a "ExampleContract" contract in Solidity. 
   "example.sol" in `contracts` contains the following code:

   ```solidity
   // SPDX-License-Identifier: MIT
   pragma solidity ^0.8.17;

   // Contract successfully uses require()
   // Contract successfully uses assert()
   // Contract successfully uses revert() statements

   contract ExampleContract {
      uint public number;
      
      function setNumber(uint _number) public {
         require(_number > 0, "Number must be greater than zero");
         number = _number;
      }
      function getNumber() public view returns (uint) {
         assert(number != 0);
         return number;
      }
      function resetNumber() public {
         if (number == 0) {
               revert("Number is already zero");
         }
         number = 0;
      }
   }
   ```

3. Prepare the migration

   "2_deploy_migration.js" in `migrations` contains the following code:

   ```javascript
   const ExampleContract = artifacts.require("ExampleContract");
   module.exports = function (deployer) {
   deployer.deploy(ExampleContract);
   };
   ```

4. Start Truffle console in development mode

   ```bash
   truffle develop
   ```

   In the Truffle console, execute

   ```bash
   compile
   migrate
   ```
   If you want to remigrate existing contracts, run `migrate --reset` instead of simply `migrate`.

5. Test your contract
