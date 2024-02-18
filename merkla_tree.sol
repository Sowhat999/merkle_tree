// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Tree{
    
    bytes32[] public hashes;



    string[4] transactions = [
        "tx1: sanarboy -> jordan",
        "tx2: jordan -> kira",
        "tx3: kira -> sam",
        "tx4: sam -> ersh"
    ];

    constructor(){
        for(uint i=0; i < transactions.length; i++){
            hashes.push(makeHash(transactions[i]));
        }

        uint count = transactions.length;
        uint offset = 0;
        while (count > 0){

            for (uint i = 0; i < count - 1; i += 2){
                hashes.push(keccak256(
                    abi.encodePacked(
                        hashes[offset + i], hashes[offset + i + 1] 
                    )
                ));
            }
            offset += count;
            count = count / 2;
        }
        
    }


    function encode(string memory input) public pure returns(bytes memory){
        return abi.encodePacked(input);
    }


    function makeHash(string memory input) public  pure returns (bytes32){
        return keccak256(
            encode(input)
        );
    }
    // check this com
}
