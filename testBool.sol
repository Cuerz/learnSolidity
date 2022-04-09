pragma solidity ^0.8.7;

contract TestBool{
    bool a = true;
    bool b = false;

    function test1() public view returns (bool){
        return a&&b;
    }

    function test2() public view returns (bool){
        return a||b;
    }
}
