// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

import "../src/erc20/ERC20FixedSupply.sol";

contract ERC20FixedSupplyTest is Test {
    ERC20FixedSupply private token;
    address private owner;

    function beforeEach() public override {
        token = new ERC20FixedSupply();
        owner = address(this);
    }

    function testInitialize() public {
        // Call initialize function
        string memory name = "My Token";
        string memory symbol = "MTK";
        uint8 decimals = 18;
        uint256 totalSupply = 1000000;
        token.initialize(name, symbol, decimals, totalSupply);

        // Verify token details
        Assert.equal(token.name(), name, "Incorrect token name");
        Assert.equal(token.symbol(), symbol, "Incorrect token symbol");
        Assert.equal(token.decimals(), decimals, "Incorrect token decimals");
        Assert.equal(token.totalSupply(), totalSupply * 10**uint256(decimals), "Incorrect token total supply");

        // Verify owner balance
        Assert.equal(token.balanceOf(owner), totalSupply * 10**uint256(decimals), "Incorrect owner balance");
    }

    function testTransfer() public {
        // Call initialize function
        string memory name = "My Token";
        string memory symbol = "MTK";
        uint8 decimals = 18;
        uint256 totalSupply = 1000000;
        token.initialize(name, symbol, decimals, totalSupply);

        // Transfer tokens
        address recipient = address(0x123);
        uint256 amount = 1000;
        token.transfer(recipient, amount);

        // Verify balances
        Assert.equal(token.balanceOf(owner), totalSupply * 10**uint256(decimals) - amount, "Incorrect owner balance");
        Assert.equal(token.balanceOf(recipient), amount, "Incorrect recipient balance");
    }
}
