pragma solidity ^0.8.7;

contract TestFixed{
    ufixed32x1 f;

    bytes1 bt1 = 0x01;
    bytes2 bt2 = "ab";
    bytes3 bt3 = "abc";

    function testCompare() public view returns (bool){
        return bt2 > bt3;
    }

    function getFirst() public view returns (bytes3){
        return bt3[0];
    }


    function getLength() public view returns (uint){
        return bt2.length;
    }
}
