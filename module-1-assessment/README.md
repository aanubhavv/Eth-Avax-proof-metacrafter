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

2. The "library" contract

   This is an example of a "library" contract in Solidity. 
   "library.sol" in `contracts` contains the following code:

   ```solidity
   // SPDX-License-Identifier: MIT
   pragma solidity ^0.8.17;
   
   contract Library {
       struct Book {
           string title;
           bool isBorrowed;
       }

       mapping(uint => Book) public books;
   
       function addBook(uint _bookId, string memory _title) public {
           require(bytes(_title).length > 0, "Book title cannot be empty");
           require(!books[_bookId].isBorrowed, "Book already exists");
           
           books[_bookId] = Book({
               title: _title,
               isBorrowed: false
           });
       }
   
       function borrowBook(uint _bookId) public {
           require(!books[_bookId].isBorrowed, "Book is already borrowed");
           assert(bytes(books[_bookId].title).length > 0);
   
           books[_bookId].isBorrowed = true;
       }
   
       function returnBook(uint _bookId) public {
           if (bytes(books[_bookId].title).length == 0) {
               revert("Book does not exist");
           }
           require(books[_bookId].isBorrowed, "Book is not borrowed");
   
           books[_bookId].isBorrowed = false;
       }
   }
   ```

3. Prepare the migration

   "2_deploy_migration.js" in `migrations` contains the following code:

   ```javascript
   const Library = artifacts.require("Library");
   module.exports = function (deployer) {
     deployer.deploy(Library);
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
   const library = await Library.deployed()
   ```

   This command retrieves the deployed instance of `library`.

   *add a book to the library*

   ```javascript
   await library.addBook(1, "book1");
   ```

   This command adds a book with ID 1 and title "book1" to the library.

   *Borrow the book*

   ```javascript
   await library.borrowBook(1);
   ```

   This command borrows the book with ID 1.


   *Return the book*

   ```javascript
   await library.returnBook(1)
   ```
   
   This command returns the book with ID 1.
