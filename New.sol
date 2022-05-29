//SPDX-License-Identifier: UNLINCENCED
pragma solidity >=0.6.0 <=0.9.0;
import "github/OpenZepplin/openzeppelin-contracts/contracts/token/ERC20.sol";
contract myERC20 is ERC20 {
    //Creating My personal token with limited supply 
    

}

contract ERC20FixedSupply is ERC20{
    constructor() public {
        _mint(msg.sender, 5000);
    }
}
//Reward for miners
contract MinerRewardMitner {
    ERC20Mintable _token;

    constructor(ERC20Mintable token) public {
        _token = token;
    }

        function mintMinerReward() public {
            _token.mint(block.coinbase, 5000);
        }
}

contract ERC20WithAutoMinerReward is ERC20 {
    function _mintMinerReward() internal {
        _mint(block.coinbase, 5000);
    }
    function _transfer(address from, address to, uint256 value) internal{
        _mintMinerReward();
        super._transfer(from, to, value);
    }
}


