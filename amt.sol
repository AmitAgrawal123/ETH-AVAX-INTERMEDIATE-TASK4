// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {
    string public name = "Decentralized Gamers";
    string public symbol = "DG";
    address public owner = msg.sender;

    mapping(address => uint256[4]) private redeemedItems;
    mapping(address => uint256) private balances;
    mapping(address => bool[4]) private hasItem;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner has the authority for this operation");
        _;
    }

    constructor() {
    }

    function mint(address account, uint256 amount) public onlyOwner {
        require(amount > 0, "Amount must exceed zero");
        balances[account] += amount;
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(amount > 0 && balances[msg.sender] >= amount, "Insufficient balance for the transfer");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        return true;
    }

    function burn(uint256 amount) public {
        require(amount > 0 && balances[msg.sender] >= amount, "Balance is too low for the burn");
        balances[msg.sender] -= amount;
    }
    
    function showRedeemableItems() public pure returns (string memory) {
        return "1. Diamond (10 AVAX)  2. Ruby (100 AVAX)  3. Sapphire (300 AVAX)  4. Coal (50 AVAX)";
    }

    function redeemToken(uint256 item, uint256 quantity) public {
        require(quantity > 0 && item >= 1 && item <= 4, "Invalid item or quantity");
        uint256 price = [10, 100, 300, 50][item - 1];
        require(balances[msg.sender] >= price * quantity && !hasItem[msg.sender][item - 1], "Insufficient balance or item already redeemed");
        hasItem[msg.sender][item - 1] = true;
        balances[msg.sender] -= price * quantity;
        redeemedItems[msg.sender][item - 1] += quantity;
    }

    function checkBalance(address account) public view returns (uint256) {
        return balances[account];
    }

    function showRedeemedItems(address account) public view returns (string memory) {
        string[4] memory itemNames = ["Diamond", "Ruby", "Sapphire", "Coal"];
        string memory result = "";

        for (uint256 i = 0; i < itemNames.length; i++) {
            if (i > 0) {
                result = string(abi.encodePacked(result, "\n"));
            }
            result = string(abi.encodePacked(result, itemNames[i], ": ", toString(redeemedItems[account][i]), " items"));
        }

        return result;
    }

    function toString(uint256 value) private pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        string memory result = "";
        while (value > 0) {
            result = string(abi.encodePacked(bytes1(uint8(48 + value % 10)), result));
            value = value / 10;
        }
        return result;
    }
}

