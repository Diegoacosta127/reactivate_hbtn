class BankAccount {
  double _balance = 0.0;

  deposit(double amount) {
    return _balance += amount;
  }

  getBalance() {
    print("Current balance: $_balance");
  }
}

void main() {
  BankAccount account = BankAccount();
  account.deposit(150.0);
  account.getBalance();
}
