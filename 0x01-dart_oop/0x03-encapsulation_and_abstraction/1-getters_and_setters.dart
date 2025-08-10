class BankAccount {
  double _balance = 0.0;
  
  double get balance => _balance;
  
  set balance(double value) {
    if(value >= 0) {
      _balance = value;
    }
  }

  String get status {
    switch(balance){
      case == 0:
        return "Empty";
      case < 150:
        return "Low";
      default:
        return "Healthy";
    }
  }
}

void main() {
  BankAccount account = BankAccount();
  account.balance = 250.0;
  print('Balance: ${account.balance}');
  print('Status: ${account.status}');
}
