// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20FlashMint.sol";

contract ERC20FixedSupply is ERC20, ERC20Permit, ERC20FlashMint, Ownable {

    constructor(
        string memory name,
        string memory symbol,
        uint256 totalSupply) ERC20(name, symbol) ERC20Permit(name) {
        _mint(msg.sender, totalSupply * 10 * decimals());
    }
}
