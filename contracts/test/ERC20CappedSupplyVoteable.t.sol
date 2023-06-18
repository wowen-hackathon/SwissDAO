// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@forge-std/Test.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "../src/erc20/ERC20CappedSupplyVoteable.sol";

contract ERC20CappedSupplyVoteableTest is Test {
    ERC20CappedSupplyVoteable private token;
    address private owner;

    uint8 private decimals = 18;
    uint256 private totalSupply = 1000000;

    function setUp() public {
        string memory name = "My Token";
        string memory symbol = "MTK";
        token = new ERC20CappedSupplyVoteable(name, symbol, totalSupply);

        owner = token.owner();
    }

    function testTransfer() public {
        // Transfer tokens
        address recipient = address(0x123);
        uint256 amount = 1000;
        assertEq(
            token.balanceOf(owner),
            totalSupply * 10 * decimals
        );
        
        // assertTrue(token.transfer(recipient, amount), "Transfer failed");
        // Verify balance
        assertEq(
            token.balanceOf(recipient),
            amount
        );
        assertEq(
            token.balanceOf(owner),
            totalSupply * 10 * decimals - amount
        );
    }

    function testDelegateVotes() public {
        // Delegate votes
        address delegate = address(0x456);
        uint256 amount = 500;
        token.delegate(delegate);

        // Verify delegate votes
        uint256 votes = token.getVotes(delegate);
        assertEq(votes, amount, "Incorrect delegate votes");
    }
}
