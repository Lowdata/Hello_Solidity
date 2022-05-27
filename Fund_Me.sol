//SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract Fund_Me{
    //for paying 
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
    // for paying in diff currency
    // we need to know the conversion rate
    //we use oracle


    }
    


}