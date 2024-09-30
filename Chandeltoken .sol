// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Contract inherits from ERC20 and Ownable
contract Chandeltoken is ERC20, Ownable(msg.sender) {

    constructor() ERC20("Nikhil", "CHNDL") {
        // Mint initial supply to the owner (optional, remove or adjust as needed)
        _mint(msg.sender, 1 * 1 ** decimals());
    }

    // Function to mint new tokens; only the owner can call this
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens from the caller's account
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Transfer function is already available from ERC20; no need to redefine
    // The getBalance() function can be replaced with the built-in balanceOf() function

    // Optional: You can rename or alias the balanceOf function for convenience
    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function getBalanceOf(address account) external view returns (uint256) {
        return balanceOf(account);
    }
}
