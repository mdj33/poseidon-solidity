// SPDX-License-Identifier: MIT OR Apache-2.0

//pragma solidity >=0.7.0;
pragma solidity ^0.6.12;
library Utils {

    function initStatesT3() internal pure returns (uint[3] memory) {
        return [uint256(1 << 64), 0, 0];
    }

    function initStatesT9() internal pure returns (uint256[9] memory) {
        return [uint256(1 << 64), 0, 0, 0, 0, 0, 0, 0, 0];
    }

    function bytesToUInt256(
        bytes memory _bytes,
        uint256 _start
    ) internal pure returns (uint256 r) {
        uint256 offset = _start + 0x20;
        require(_bytes.length >= offset, 'X');
        assembly {
            r := mload(add(_bytes, offset))
        }
    }

    function bytesToUInt128(
        bytes memory _bytes,
        uint256 _start
    ) internal pure returns (uint128 r) {
        uint256 offset = _start + 0x10;
        require(_bytes.length >= offset, 'W');
        assembly {
            r := mload(add(_bytes, offset))
        }
    }
}
