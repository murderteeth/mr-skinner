//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface SkinManager {
    function skinOf(uint summoner) external view returns (address implementation, uint tokenId);
}

interface SkinSource {
    function tokenURI(uint _tokenId) external view returns (string memory);
}

contract MrSkinner {
    SkinManager public manager = SkinManager(0xfFDFc7286c2c8d0a94f99c5e00dA1851564f8C1d);
    function tokenURI(uint summoner) public view returns (string memory) {
        (address implementation, uint tokenId) = manager.skinOf(summoner);
        if(implementation == address(0)) {
            return "";
        } else {
            SkinSource source = SkinSource(implementation);
            return source.tokenURI(tokenId);
        }
    }
}
