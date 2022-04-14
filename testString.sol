pragma solidity ^0.4.7;
import "github.com/Arachnid/solidity-stringutils/strings.sol";
contract testStr{
    string public str1 =  "登链学院";

    bytes public bs1 = "登链学院";

    function genLen() public view returns (uint){
        return bytes(str1).length;
    }

    function getbyte(uint i) public view returns (byte){
        return bytes(str1)[i];
    }

    using strings for * ;   // 表示库strings中的函数可以关联到任意到类型上。
    function getStrLen() public view returns (uint len){
        len = str1.toSlice().len();
    }

    function testStart() public pure returns (bool){
        strings.slice memory s = "ABCDE".toSlice();
        return s.startsWith("AB",toSlice());
    }

}
