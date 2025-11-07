import 'bank_account.dart';


class CheckingAccount extends BankAccount {
  static const double overdraftFee = 35.0;

  CheckingAccount(String accountNumber, String holder, double initialBalance)
      : super(accountNumber, holder, initialBalance);

  @override
  void withdraw(double amount) {
    validateAmount(amount);
    if (balance - amount < 0) {
      balance = balance - (amount + overdraftFee);
      log('WITHDRAW (OVERDRAFT)', amount + overdraftFee);
      print('Warning: Overdraft! Fee: \$$overdraftFee');
    } else {
      balance = balance - amount;
      log('WITHDRAW', amount);
    }
    print('Success: Withdrew \$${amount.toStringAsFixed(2)}');
  }

  @override
  void deposit(double amount) {
    validateAmount(amount);
    balance = balance + amount;
    log('DEPOSIT', amount);
    print('Success: Deposited \$${amount.toStringAsFixed(2)}');
  }
}