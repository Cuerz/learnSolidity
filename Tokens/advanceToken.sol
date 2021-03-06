pragma solidity ^0.4.20;

import './owned.sol';
import './erc20.sol';

contract AdvanceToken is ERC20,owned {
    mapping(address => bool) public frozenAccount;

    event AddSupply(uint amount);
    event FrozenFunds(address target,bool frozen);
    event Burn(address target,uint amount);

    constructor(string _name) ERC20(_name) public {
    }

    // 挖矿
    function mine(address target,uint amount) public onlyOwner{
        totalSupply += amount;
        balanceOf[target] += amount;

        emit AddSupply(amount);
        emit Transfer(0, target, amount);
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        return _transfer(msg.sender,_to,_value);

    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(allowed[_from][msg.sender] >= _value);
        success = _transfer(_from,_to,_value);
        allowed[_from][msg.sender] -= _value;
        
        return true;
    }

    function _transfer(address _from, address _to, uint256 _value) internal returns (bool success){
        require(_to != address(0));
        require(!frozenAccount[msg.sender]);

        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >balanceOf[_to]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
 
        emit Transfer(_from, _to, _value);

        return true;
    }

    function burn(uint256 _value) public returns (bool success){
        require(balanceOf[msg.sender] >= _value);

        totalSupply -= _value;
        balanceOf[msg.sender] -= _value;

        emit Burn(msg.sender,_value);
        return true;
    }

    function burnFrom(address _from,uint _value) public returns (bool success){
        require(balanceOf[_from] >= _value);
        require(allowed[_from][msg.sender] >= _value);

        totalSupply -= _value;
        balanceOf[_from] -= _value;
        allowed[_from][msg.sender] -= _value;

        emit Burn(msg.sender,_value);
        return true;
    }

    // 冻结
    function freezeAccount(address target, bool freeze) public onlyOwner{
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }
}
