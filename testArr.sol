pragma solidity ^0.4.7;

contract testArr{
    uint [10] tens;
    uint [] us;

    uint [] public u = [1,2,3];
    uint [] public b = new uint[](7);  // storage

    function get() public view returns (uint){
        return tens[0];
    }

    uint[][5] public a;
    function set() public {
        a[1]=[1,2];
        a[2]=[1,3];
    }

    function getLen() public view returns (uint){
        return tens.length;
    }

    function modifyLenAndPush() public returns (uint){
        b.length=10;

        b[7]=100;
        b.push(20);
        return b.length;

    }
}
