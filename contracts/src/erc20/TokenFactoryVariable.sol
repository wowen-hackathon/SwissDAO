// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20VariableSupply} from "./ERC20VariableSupply.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract TokenFactoryVariable {

    constructor() {}

    event TokenCreated(address indexed tokenAddress);

    function create(
        string memory name,
        string memory symbol,
        uint256 totalSupply
    ) external returns (address) {
        ERC20VariableSupply token = new ERC20VariableSupply(name, symbol, totalSupply);
        
        address tokenAddress = address(token);

        // Transfer ownership of the token to the caller of the factory
        token.transferOwnership(msg.sender);

        emit TokenCreated(tokenAddress);
        return tokenAddress;
    }
}