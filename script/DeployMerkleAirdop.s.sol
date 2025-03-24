// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {MerkleAirdrop} from "../src/MerkleAirdrop.sol";
import {BagelToken} from "../src/BagelToken.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DeployMerkleAirdop is Script {
    function deployMerkleAirdrop() public returns(MerkleAirdrop, BagelToken){
        vm.startBroadcast();
        BagelToken token = new BagelToken();
        MerkleAirdrop airdrop = new MerkleAirdrop(s_merkleRoot, IERC20(address(token)));
        vm.stopBroadcast();
    }


    function run() external returns (MerkleAirdrop, BagelToken){

    }
}