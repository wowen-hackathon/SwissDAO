// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./ERC20FixedSupply.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20VariableSupply is ERC20FixedSupply, ERC20Burnable, Ownable {

   function initialize(string memory _name, string memory _symbol, uint8 _decimals, uint256 _mintSupply) external onlyOwner{
        require(totalSupply == 0, "Token already initialized");
        name = _name;
        symbol = _symbol;
        decimals = _decimals;

        balanceOf[msg.sender] = _mint(msg.sender, _totalSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(address account, uint256 amount) {
        super._burn(account, amount);
    }
}