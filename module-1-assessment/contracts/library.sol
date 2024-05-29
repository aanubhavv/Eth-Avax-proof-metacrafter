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
