import 'bank_account.dart';
import 'exceptions.dart';

class StudentAccount extends BankAccount {
  static const double maxBalance = 5000.0;

  StudentAccount(String accountNumber, String holder, double initialBalance)
      : super(accountNumber, holder, initialBalance) {
    if (initialBalance > maxBalance)
      throw MaximumBalanceViolationException('Max \$5,000 for student');
  }

  @override
  void withdraw(double amount) {
    _validateAmount(amount);
    if (_balance - amount < 0)
      throw InsufficientBalanceException('Insufficient funds');
    _balance -= amount;
    _log('WITHDRAW', amount);
    print('✅ Withdrew \$${amount.toStringAsFixed(2)}');
  }

  @override
  void deposit(double amount) {
    _validateAmount(amount);
    if (_balance + amount > maxBalance)
      throw MaximumBalanceViolationException('Cannot exceed \$5,000');
    _balance += amount;
    _log('DEPOSIT', amount);
    print('✅ Deposited \$${amount.toStringAsFixed(2)}');
  }
}