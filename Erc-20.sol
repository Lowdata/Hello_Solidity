//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;
contract VOHCoinERC20{
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed takeOwner, address indexed spender, uint token);
    
    string public constant name = "VOH COIN";
    string public constant symbol = "VOHN";
    uint8 public constant decimals= 18;
    
    mapping(address=> uint256) balance;
    mapping(address=> mapping(address=>uint256)) allowed;
    uint256 _totalSupply;
    
    //construct a class for the token
    constructor(uint256 total){
        _totalSupply = total;
        balance[msg.sender] = _totalSupply;
    }
    
    // function for the ba;ance
    function balanceOf(address takeOwner) public view returns(uint){
        return balance[takeOwner];
    }
    
    //transfer function
    function transferToken(address reciever, uint numTokens) payable public returns(bool){
        require(numTokens <= balance[msg.sender]);
        balance[msg.sender] -= numTokens;
        balance[msg.sender] += numTokens;
        emit Transfer(msg.sender, reciever, numTokens);
        return true;
    }
    
    //approval function
    function approve(address delegate, uint numTokens) public returns(bool){
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    
    }
    //allowance
    function Allowance(address owner, address delegate) public view returns(uint) {
        return allowed[owner][delegate];
    } 
    function transferFrom(address owner, address buyer, uint numTokens) payable public returns(bool){
        require(numTokens<= balance[owner]);
        require(numTokens<= allowed[owner][msg.sender]);
        balance[owner] -= numTokens;
        allowed[owner][msg.sender] += numTokens;
        balance[buyer] += numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
    



    

    
}