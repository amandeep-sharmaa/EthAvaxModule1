// SPDX-License-Identifier: MIT
pragma solidity 0.8.7; //specify the solidity version
contract MyTransaction {     

    //Mapping of Address to balance
    mapping(address => uint) public balances;

    //Mapping of Address to invested amount
    mapping(address=>uint) public investedAmount; 
    
    //function to deposit amount in the account , It uses "require()".
    function deposit(address account, uint value) public {
        require(value>0,"Invalid Value");         
        balances[account] = balances[account] + value;   
    }
    
    //function to withdraw amount from the account, It uses "assert()".
    function withdraw(address account, uint value) public {
        assert(value>0&&balances[account]>=value);          
        balances[account] = balances[account]- value;    
      }  

    //function to invest , It uses "revert".
   //minimum amount to invest is 50.
    function invest(address account,uint value) public {
        if((balances[account]<value)||value<50){
            revert("Either balance in Account is not enough or Value is not enough");
        }
        balances[account]=balances[account]-value;
        investedAmount[account]=value;
    }
}