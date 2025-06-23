// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This contract represents a simple token, named "MyToken" (symbol: MTK)
contract SimpleToken {

    // Public variables that store token information
    string public name = "MyToken";            // Name of the token
    string public symbol = "MTK";              // Symbol of the token (e.g., "MTK")
    uint8 public decimals = 18;                // Decimals for the token (standard for ERC-20 is 18)
    uint256 public totalSupply = 1000000 * (10 ** uint256(decimals));  // Total supply of tokens (1 million tokens with 18 decimals)

    // Mapping to track the balances of each address
    mapping(address => uint256) public balanceOf;

    // Event to log transfers (emitted on every successful transfer)
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Constructor to initialize the contract
    constructor() {
        // Assign the total supply to the contract creator's address
        balanceOf[msg.sender] = totalSupply;

        // Emit a transfer event to indicate the creation of the token supply
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    // Transfer function allows users to send tokens to another address
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // Ensure the sender has enough balance to perform the transfer
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        // Deduct the value from the sender's balance
        balanceOf[msg.sender] -= _value;

        // Add the value to the recipient's balance
        balanceOf[_to] += _value;

        // Emit the transfer event
        emit Transfer(msg.sender, _to, _value);

        // Return true to indicate successful transfer
        return true;
    }
}
