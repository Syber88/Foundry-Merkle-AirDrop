// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract ClaimAirdrop is Script {
    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment("MerkeleAirdrop", block.chainid);
    }
}
