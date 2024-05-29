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

   *Get the Deployed Contract Instance*

   ```javascript
   const example = await ExampleContract.deployed();
   ```

   This command retrieves the deployed instance of `ExampleContract`.

   *Set 'number' to a Non-zero Value (e.g., 10)*

   ```javascript
   await example.setNumber(10);
   ```

   This command sets the `number` to 10, using the first account from the list of available accounts.

   *Check theValue number*

   ```javascript
   let number = await example.getNumber();
   console.log("number: ", number.toString());
   ```

   This command retrieves the initial value of `number` and prints it. Since the contract uses `assert` to check if the `number` is not zero in `getNumber()`, it 
   might revert if the initial value is zero. Instead, directly accessing the state variable may be required to check the initial value.


   *Reset 'number' to 0*

   ```javascript
   await example.resetNumber();
   ```
   
   By executing each step individually in the Truffle console, you can interactively verify the behavior of your `ExampleContract`.