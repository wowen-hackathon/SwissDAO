// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20FlashMint.sol";

contract ERC20FixedSupply is ERC20, ERC20Permit, ERC20FlashMint {
    constructor(uint256 premint) ERC20("MyToken", "MTK") ERC20Permit("MyToken") {
        _mint(msg.sender, premint * 10 ** decimals());
    }
}