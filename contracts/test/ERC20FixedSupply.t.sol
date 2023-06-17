// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@forge-std/Test.sol";
import {console} from "@forge-std/console.sol";
import {stdStorage, StdStorage, Test} from "@forge-std/Test.sol";

import "../src/erc20/ERC20FixedSupply.sol";

contract ERC20FixedSupplyBaseSetup is ERC20FixedSupply, Test {
    Utils internal utils;
    address payable[] internal users;

    address internal alice;
    address internal bob;

    function setUp() public virtual {
        utils = new Utils();
        users = utils.createUsers(5);

        alice = users[0];
        vm.label(alice, "Alice");
        bob = users[1];
        vm.label(bob, "Bob");
    }
}

contract ERC20FixedSupplyTest is ERC20FixedSupplyBaseSetup {

    function testTransfer() public {
        uint8 decimals = 18;
        uint256 totalSupply = 1000000;
        // Transfer tokens
        address recipient = address(0x123);
        uint256 amount = 1000;
        token.transfer(recipient, amount);

        // Verify balances
        assertEq(token.balanceOf(owner), totalSupply * 10**uint256(decimals) - amount, "Incorrect owner balance");
        assertEq(token.balanceOf(recipient), amount, "Incorrect recipient balance");
    }
}
