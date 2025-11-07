import 'bank_account.dart';
import 'exceptions.dart';

class CheckingAccount extends BankAccount {
  static const double overdraftFee = 35.0;

  CheckingAccount(String accountNumber, String holder, double initialBalance)
      : super(accountNumber, holder, initialBalance);

  @override
  void withdraw(double amount) {
    _validateAmount(amount);
    if (_balance - amount < 0) {
      _balance -= (amount + overdraftFee);
      _log('WITHDRAW (OVERDRAFT)', amount + overdraftFee);
      print('⚠️ Overdraft! Fee: \$$overdraftFee');
    } else {
      _balance -= amount;
      _log('WITHDRAW', amount);
    }
    print('✅ Withdrew \$${amount.toStringAsFixed(2)}');
  }

  @override
  void deposit(double amount) {
    _validateAmount(amount);
    _balance += amount;
    _log('DEPOSIT', amount);
    print('✅ Deposited \$${amount.toStringAsFixed(2)}');
  }
}