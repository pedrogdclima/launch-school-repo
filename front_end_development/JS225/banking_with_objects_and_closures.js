function makeBank () {
  let currentAccountNumber = 101;
  let accounts = [];
  function makeAccount(accountNumber) {
    let total = 0;
    let transactionLogs = [];
    return {
      number() {
        return accountNumber;
      },
      balance() {
        return total;
      },
      deposit(amount) {
        total += amount;
        this.newTransaction('deposit', amount);
        return amount;
      },
      withdraw(amount) {
        if (amount > total) {
          amount = total;
        }
        total -= amount;
        this.newTransaction('withdraw', amount);
        return amount;
      },
      newTransaction(type, amount) {
        transactionLogs.push({type, amount});
      },
      transactions() {
        transactionLogs.forEach( ele => console.log(ele) );
      }
    }
  }

  return {
    openAccount() {
      let newAccount = makeAccount(this.accountNumber());
      accounts.push(newAccount);
      return newAccount;
    },
    accountNumber() {
      return currentAccountNumber++;
    },
    transfer(source, destination, amount) {
      destination.deposit(source.withdraw(amount));
    },
  }
}


let myBank = makeBank();
let firstAccount = myBank.openAccount();
let secondAccount = myBank.openAccount();

firstAccount.deposit(1500);
firstAccount.deposit(3200);
firstAccount.deposit(340);
firstAccount.withdraw(610);
console.log(firstAccount.balance());
myBank.transfer(firstAccount, secondAccount, 2000);
firstAccount.transactions();
// secondAccount.transactions();