// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";

contract ERC20FixedSupply is ERC20, ERC20Permit, Ownable {
    constructor(
        string memory name,
        string memory symbol,
        uint256 totalSupply) ERC20(name, symbol) ERC20Permit(name) {
        _mint(msg.sender, totalSupply * 10 * decimals());
    }
}
