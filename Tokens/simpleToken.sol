pragma solidity ^0.8.7;

contract SimpleToken {
    mapping(address => uint) public balanceOf;

    constructor(uint256 initialSupply){
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address _to ,uint _value) public{
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
}