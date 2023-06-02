// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20FixedSupply} from "ERC20FixedSupply.sol";

contract TokenFactory {
    event TokenCreated(address indexed tokenAddress);

    function createToken(string memory _name, string memory _symbol, uint256 _amount) external returns (address) {
        bytes32 salt = keccak256(abi.encodePacked(_name, _symbol));
        address tokenAddress;

        // Create2 address computation
        assembly {
            let bytecode := type(ERC20FixedSupply).creationCode
            tokenAddress := create2(0, add(bytecode, 32), mload(bytecode), salt)
            if iszero(extcodesize(tokenAddress)) {
                revert(0, 0)
            }
        }

        emit TokenCreated(tokenAddress);
        return tokenAddress;
    }
}