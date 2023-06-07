// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./ERC20FixedSupply.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract ERC20FixedSupplyVoteable is ERC20FixedSupply, ERC20Votes {

    function initialize(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) external onlyOwner {
        require(totalSupply() == 0, "Token already initialized");
        _name = _name;
        _symbol = _symbol;
        _setupDecimals(_decimals);
        _mint(msg.sender, _totalSupply);
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
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}