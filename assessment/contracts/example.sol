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