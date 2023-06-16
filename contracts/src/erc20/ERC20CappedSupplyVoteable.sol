// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20FlashMint.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract ERC20CappedSupplyVoteable is ERC20, ERC20Permit, ERC20FlashMint, Ownable, ERC20Burnable, ERC20Votes, ERC20Capped {

    constructor(
        string memory name,
        string memory symbol,
        uint256 totalSupply) ERC20(name, symbol) ERC20Permit(name) ERC20Burnable() ERC20Votes() ERC20Capped(totalSupply) {
            _mint(msg.sender, totalSupply);
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