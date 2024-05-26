# MyTransaction
MyTransaction is a Solidity Program , It is a simple implemenation of Solidity and uses the require(), assert() and revert() statements , It allows users to perform transaction in the account , It also has feature to invest the amount.

## Description

This Project is  a Smart contract written in Solidity that have Three Public functions  "deposit", "withdraw" and "invest". deposit function is responsible for adding amount in the Account and updating the balance while withdraw function is responsible for withdrawing amount from Account and updating the balance of the given address and "invest"
function is used to invest a part of amount from your account and updating the balance of account after investing.

## Getting Started

### Installing

* Clone this repository or download the Solidity file or copy the code.
* Make sure you have an IDE for Solidity like Remix (https://remix.ethereum.org/).

### Executing program

* First, go to the Remix Site (https://remix.ethereum.org/).
* Now Copy the Code below in the IDE and Save the file with .sol (eg. MyTransaction.sol) extension.
  
```javascript
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
```
* #### Compile the Contract:
    Open the “Solidity Compiler” tab in the left-hand sidebar, ensure that the “Compiler” option is set to version “0.8.7” (or Auto Compile is enabled , it will 
    automatically select the suitable version) and then click on the “Compile MyTransaction.sol” button.
* #### Deploy the Contract:
    Navigate to the “Deploy & Run Transactions” tab in the left-hand sidebar, from the dropdown menu, select the “MyTransaction” contract and then click on the “Deploy” button.
* #### Interact with the contract
    Once the contract is deployed , you can interact by calling the "deploy", "withdraw" and "invest" function.


## Authors

Amandeep Sharma

inspireamandeep1@gmail.com

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
