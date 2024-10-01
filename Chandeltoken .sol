// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Contract inherits from ERC20 and Ownable
contract Chandeltoken is ERC20, Ownable(msg.sender) {

    constructor() ERC20("Nikhil", "CHNDL") {
        // Mint initial supply to the owner
        _mint(msg.sender, 1 * 10 ** decimals());
    }

    // Function to mint new tokens; only the owner can call this
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens from the caller's account
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Optional convenience functions for balance checking
    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function getBalanceOf(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    // Custom transfer function for transferring tokens
    function customTransfer(address to, uint256 amount) external returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }
}
