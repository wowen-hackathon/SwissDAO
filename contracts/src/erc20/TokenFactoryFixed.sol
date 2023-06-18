// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20FixedSupply} from "./ERC20FixedSupply.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract TokenFactoryFixed {

    constructor() {}

    event TokenCreated(address indexed tokenAddress);

    function create(
        string memory name,
        string memory symbol,
        uint256 totalSupply
    ) external returns (address) {
        ERC20FixedSupply token = new ERC20FixedSupply(name, symbol, totalSupply);
        
        address tokenAddress = address(token);

        // Transfer ownership of the token to the caller of the factory
        token.transferOwnership(msg.sender);

        emit TokenCreated(tokenAddress);
        return tokenAddress;
    }
}