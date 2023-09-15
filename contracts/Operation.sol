// SPDX-License-Identifier: MIT OR Apache-2.0

//pragma solidity >=0.7.0;
pragma solidity ^0.6.12;
library Operation {
    uint256  constant F =
    21888242871839275222246405745257275088548364400416034343698204186575808495617;

    int128 constant BALANCE_LOWER_BOUND = 1<<63;
    int128 constant FUNDING_INDEX_LOWER_BOUND = 1<<63;
    struct Asset {
        uint128 id;
        int128 balance;
        int128 funding_idx;
    }

    struct Position {
        uint256[2] pubkey;
        int128 balance;
        Asset[] assets;
        uint256 timestamp;
    }

    struct MerkleProof {
        uint256  subleaf;
        uint64 id;  //id is compose with prefix_id+sub_id
        uint256[32] subPath;
        uint256 prefixLeaf; //=hash9(subRoot)
        uint256[32] prefixPath;
        uint256 subRoot;
        uint256 treeRoot;  //treeRoot= hash(hash(leaf+subPath),prefixPath)
    }
}
