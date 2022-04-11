pragma solidity ^0.4.7;


contract TsetAddr{
    function testBalance() public view returns(uint){
        address a = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        return a.balance;
    }

    function testSelfBalance() public view returns(uint){
        address a = address(this);
        return a.balance;
    }

    function balance(address a) public view returns(uint){
        return a.balance;
    }

    function testTransfer(address a) public {
        address myAddress = address(this);
        if(myAddress.balance >= 1e18){
            a.transfer(1e18);
        }
    }
}
