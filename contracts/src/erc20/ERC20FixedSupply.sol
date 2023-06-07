// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20FlashMint.sol";

contract ERC20FixedSupply is ERC20, ERC20Permit, ERC20FlashMint, Ownable {
    
    function initialize(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) external onlyOwner {
        require(totalSupply() == 0, "Token already initialized");
        _name = _name;
        _symbol = _symbol;
        _setupDecimals(_decimals);
        _mint(msg.sender, _totalSupply);
    }
}
