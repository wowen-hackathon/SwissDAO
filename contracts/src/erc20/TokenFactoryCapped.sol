// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20CappedSupplyVoteable} from "./ERC20CappedSupplyVoteable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract TokenFactoryCapped {

    constructor() {}

    event TokenCreated(address indexed tokenAddress);

    function create(
        string memory name,
        string memory symbol,
        uint256 totalSupply
    ) external returns (address) {

        ERC20CappedSupplyVoteable token = new ERC20CappedSupplyVoteable(name, symbol, totalSupply);
        
        address tokenAddress = address(token);

        // Transfer ownership of the token to the caller of the factory
        token.transferOwnership(msg.sender);

        emit TokenCreated(tokenAddress);
        return tokenAddress;
    }
}