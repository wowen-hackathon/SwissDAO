// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20FixedSupply} from "ERC20FixedSupply.sol";
import {ERC20FixedSupplyVoteable} from "ERC20FixedSupplyVoteable.sol";
import {ERC20VariableSupply} from "ERC20VariableSupply.sol";

contract TokenFactory {
    enum TokenType {
        FixedSupply,
        FixedSupplyVoteable,
        VariableSupply
    }

    event TokenCreated(address indexed tokenAddress);

    function createToken(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _totalSupply,
        TokenType _tokenType
    ) external returns (address) {
        bytes32 salt = keccak256(abi.encodePacked(_name, _symbol));
        address tokenAddress;

        // Create2 address computation
        assembly {
            let bytecode := getBytecode(_tokenType)
            tokenAddress := create2(0, add(bytecode, 32), mload(bytecode), salt)
            if iszero(extcodesize(tokenAddress)) {
                revert(0, 0)
            }
        }

        // Initialize the ERC20Token contract by calling the initialize function
        if (_tokenType == TokenType.FixedSupply) {
            ERC20FixedSupply(tokenAddress).initialize(_name, _symbol, _decimals, _totalSupply);
        } else if (_tokenType == TokenType.FixedSupplyVoteable) {
            ERC20FixedSupplyVoteable(tokenAddress).initialize(_name, _symbol, _decimals, _totalSupply);
        } else if (_tokenType == TokenType.VariableSupply) {
            ERC20VariableSupply(tokenAddress).initialize(_name, _symbol, _decimals, _totalSupply);
        } else {
            revert("Invalid token type");
        }

        // Transfer ownership of the token to the caller of the factory
        Ownable(tokenAddress).transferOwnership(msg.sender);

        emit TokenCreated(tokenAddress);
        return tokenAddress;
    }

    function getBytecode(TokenType _tokenType) private pure returns (bytes memory) {
        if (_tokenType == TokenType.FixedSupply) {
            return type(ERC20FixedSupply).creationCode;
        } else if (_tokenType == TokenType.FixedSupplyVoteable) {
            return type(ERC20FixedSupplyVoteable).creationCode;
        } else if (_tokenType == TokenType.VariableSupply) {
            return type(ERC20VariableSupply).creationCode;
        } else {
            revert("Invalid token type");
        }
    }
}