pragma solidity ^0.8.7;

// 合约包含的内容 状态变量、函数、函数修饰器、事件、结构类型

// 引入一个合约文件
import "./first_interface.sol";

// 合约
contract SimpleStorage {
    uint storedData;

    // 定义事件，事件不需要实现
    event Set(uint value);

    struct Circle{
        uint radius;
    }

    Circle C;

    // 定义一个函数修改器
    modifier mustOver(uint value){
        require(value>=10);
        _;
    }

    function set(uint x) public mustOver(x){
        storedData = x;
        C = Circle(x);
        emit Set(x);
    }

    function get() view public returns (uint) {
        return storedData;
    }
}
