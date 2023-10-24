# Decentralized Gamers Token (DG Token)

## Description

Decentralized Gamers Token (DG Token) is a Solidity smart contract built on the Ethereum blockchain. It enables the creation and management of a token (DG) that can be minted, transferred, burned, and redeemed for in-game items. The smart contract features an ownership system and various functions for interacting with the token, checking balances, and redeeming items. This README provides an overview of how to use and interact with the DG Token smart contract.

## Getting Started

### Prerequisites

Before using the Decentralized Gamers Token smart contract, make sure you have the following:

- An Ethereum wallet (e.g., MetaMask) installed in your web browser.
- A connection to an Ethereum network with available Ether (ETH) for gas fees.

### Usage

1. **Deploy the Smart Contract:**
   - Deploy the smart contract to an Ethereum network, and take note of its address.

2. **Interact with the Smart Contract:**
   - Connect your Ethereum wallet to the deployed smart contract.
   - Use the provided functions to interact with the DG Token.

### Functions and Features

The smart contract provides the following functions:

- **`mint(address account, uint256 amount)`**:
  - Only the owner of the contract can mint new tokens to a specified account with a specified amount.

- **`transfer(address recipient, uint256 amount)`**:
  - Allows users to transfer DG Tokens to another Ethereum address, given they have a sufficient balance.

- **`burn(uint256 amount)`**:
  - Allows users to burn (destroy) a specific amount of their DG Tokens.

- **`showRedeemableItems()`**:
  - A view function that returns a string listing the available in-game items that can be redeemed using DG Tokens.

- **`redeemToken(uint256 item, uint256 quantity)`**:
  - Allows users to redeem in-game items by specifying the item number and quantity, provided they have enough DG Tokens and have not already redeemed the item.

- **`checkBalance(address account)`**:
  - A view function to check the balance of DG Tokens for a specific Ethereum address.

- **`showRedeemedItems(address account)`**:
  - A view function that displays the in-game items redeemed by a specific Ethereum address.

## Author

- Amit

## License

This project is open-source and is licensed under the MIT License. See the LICENSE file for details.

## Smart Contract Address

The smart contract for Decentralized Gamers Token is deployed at the address: `0x361e0bFCEe89DbF4E07Fb8890F67C69073E15618`. You can interact with it using Ethereum wallet software that supports smart contract interaction.

For more details on the functions and usage of the smart contract, refer to the Solidity code and comments within the contract itself.

