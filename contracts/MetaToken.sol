// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract CryptoTokens is ERC721A {
    // The owner of the contract
    address public owner;

    // Maximum quantity of tokens that can be minted
    uint256 public maxQuantity = 10;

    // Base URL for the token metadata
    string baseUrl = "generate few cryprotokens currencies.url";

    // Prompt description for the tokens
    string public prompt = "Collect Crypto Tokens from around the world";

    // Constructor to set the initial values
    constructor() ERC721A("CryptoTokens", "CTK") {
        owner = msg.sender;
    }

    // Modifier to restrict certain functions to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action!");
        _;
    }

    // Function to mint new tokens, restricted to the owner
    function mint(uint256 quantity) external payable onlyOwner {
        require(
            totalSupply() + quantity <= maxQuantity,
            "You can not mint more than 10"
        );
        _mint(msg.sender, quantity);
    }

    // Internal function to return the base URL for token metadata
    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    // External function to return the prompt description
    function promptDescription() external view returns (string memory) {
        return prompt;
    }
}
