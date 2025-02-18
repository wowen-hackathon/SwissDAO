// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20Votes} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import {ERC20Capped} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract ERC20CappedSupplyVoteable is ERC20, ERC20Permit, Ownable, ERC20Burnable, ERC20Votes, ERC20Capped {

    constructor(
        string memory name,
        string memory symbol,
        uint256 totalSupply) ERC20(name, symbol) ERC20Permit(name) ERC20Burnable() ERC20Votes() ERC20Capped(totalSupply * 10 * decimals()) {
            _mint(msg.sender, totalSupply * 10 * decimals());
    }
    // The following functions are overrides required by Solidity.

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes, ERC20Capped)
    {
        require((totalSupply() + amount) <= cap(), "Amount exceeds token cap. Can not mint.");

        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}