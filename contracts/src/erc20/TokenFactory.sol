// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20FixedSupply} from "./ERC20FixedSupply.sol";
import {ERC20CappedSupplyVoteable} from "./ERC20CappedSupplyVoteable.sol";
import {ERC20VariableSupply} from "./ERC20VariableSupply.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract TokenFactory {
    enum TokenType {
        FixedSupply,
        FixedSupplyVoteable,
        VariableSupply
    }

    event TokenCreated(address indexed tokenAddress);

    function create(
        string memory name,
        string memory symbol,
        uint256 totalSupply,
        TokenType tokenType
    ) external returns (address) {

        ERC20 token;

        // Initialize the ERC20Token contract by calling the initialize function
        if (tokenType == TokenType.FixedSupply) {
            token = new ERC20FixedSupply(name, symbol, totalSupply);
        } else if (tokenType == TokenType.FixedSupplyVoteable) {
            token = new ERC20CappedSupplyVoteable(name, symbol, totalSupply);
        } else if (tokenType == TokenType.VariableSupply) {
            token = new ERC20VariableSupply(name, symbol, totalSupply);
        } else {
            revert("Invalid token type");
        }

        address tokenAddress = address(token);

        // Transfer ownership of the token to the caller of the factory
        Ownable(tokenAddress).transferOwnership(msg.sender);

        emit TokenCreated(tokenAddress);
        return tokenAddress;
    }
}