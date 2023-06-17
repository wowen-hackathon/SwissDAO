// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@forge-std/Test.sol";
import {console} from "@forge-std/console.sol";
import {stdStorage, StdStorage, Test} from "@forge-std/Test.sol";

import "../src/erc20/ERC20FixedSupply.sol";

contract ERC20FixedSupplyBaseSetup is ERC20FixedSupply, Test {
    address internal alice;
    address internal bob;
    
    constructor() ERC20FixedSupply("Test Token Fixed", "TTF", 1000000) {

    }

    function setUp() public virtual {
        alice = vm.addr(1);
        vm.deal(alice, 100 ether);
        vm.label(alice, "Alice");

        bob = vm.addr(2);
        vm.deal(bob, 100 ether);
        vm.label(bob, "Bob");
    }
}

contract ERC20FixedSupplyTest is ERC20FixedSupplyBaseSetup {

    function setUp() public virtual override {
        ERC20FixedSupplyBaseSetup.setUp();
        console.log("When transferring tokens");
    }

    function testTransfer() public {
        // Transfer tokens
        uint256 amount = 1000;

        this.transfer(bob, amount);

        // Verify balances
        assertEq(this.balanceOf(address(this)), totalSupply * 10**decimals() - amount);
        assertEq(this.balanceOf(bob), amount, "Incorrect recipient balance");
    }
}
