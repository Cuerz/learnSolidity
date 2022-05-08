pragma solidity ^0.4.7;

interface token{
    function transfer(address _to,uint amount) external;
}

contract Ico{
    uint public fundingGoal;
    uint public deadline;
    uint public price;
    uint public fundAmount;
    token public tokenReward;
    address public beneficiary;
    mapping(address => uint) public balanceOf;

    event FundTransfer(address backer,uint amount)
    event GoalReached(bool success);

    constructor(uint fundingGoalInEthers,uint durationInMinutes,uint etherCostofEachToken,address addressOfToken) {
        beneficiary = msg.sender;
        fundingGoal = fundingGoalInEthers * 1 ether;
        deadline = now + durationInMinutes * 1 minutes;
        price = etherCostofEachToken;
        tokenReward = token(addressOfToken);
    }

    function () public payable{
        require(now<deadline);

        uint amount = msg.value;
        balanceOf[msg.sender] += amount;
        fundAmount += amount;
        uint tokenAmount = 0;
        if (amount == 0){
            tokenAmount = 10;
        } else{
            tokenAmount = amount/price;
        }
        tokenReward.transfer(msg.sender,tokenAmount);

        emit FundTransfer(msg.sender,amount);
    }

    modifier afterDeadline() {
        require (now >= deadline)
        _;
    }
    
    function checkGoalReached() public afterDeadline{
        if (fundAmount >= fundingGoal){
            emit GoalReached(true);
        }
    }

    function withdrawal() public afterDeadline{
        if (fundAmount >= fundingGoal) {
            if (beneficiary == msg.sender){
                beneficiary.transfer(fundAmount);
            }  
        } else{
            uint amount = balanceOf[msg.sender]
            if(amount > 0){
                msg.sender.transfer(amount);
                balanceOf[msg.sender] = 0;
            }
        }
    }
}
