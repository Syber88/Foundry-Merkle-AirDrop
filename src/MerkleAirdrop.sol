// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";


contract MerkleAirdrop {

    error MerkleAirdrop__InvalidProof();

    bytes32 private immutable i_merkleRoot;
    IERC20 private immutable i_airdropToken; 
    
    constructor (bytes32 merkleRoot, IERC20 airdropToken) {
        i_merkleRoot = merkleRoot;
        i_airdropToken = airdropToken;

    }

    function claim(address account, uint256 amount, bytes32[] calldata merkleProof) external {
        bytes32 leaf = keccak256(bytes.concat(keccak256(abi.encode(account, amount))));
        if (!MerkleProof.verify(merkleProof, i_merkleRoot, leaf)){
            revert MerkleAirdrop__InvalidProof()
        }
    }

}