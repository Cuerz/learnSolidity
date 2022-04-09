pragma solidity ^0.8.7;

contract TestFlow{
    uint256 public zero = 0;
    uint256 public max = 2**256-1;
    uint256 public mm = 2**255;

    // 发生溢出
    function subUnderFlow() public view returns (uint){
        uint256 a = zero-1;
        return a;
    }

    function addOverFlow() public view returns (uint){
        uint256 a = max+1;
        return a;
    }

    function mulOverFlow() public view returns (uint){
        uint256 a = mm*2;
        return a;
    }

    function add(uint8 x,uint8 y) public view returns (uint8){
        uint8 z=x+y;
        assert(z>=x);
        return z;
    }
}
