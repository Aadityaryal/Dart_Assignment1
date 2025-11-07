import 'bank_account.dart';
import 'interest_bearing.dart';
import 'exceptions.dart';

class PremiumAccount extends BankAccount implements InterestBearing {
  static const double minBalance = 10000.0;

  PremiumAccount(String accountNumber, String holder, double initialBalance)
      : super(accountNumber, holder, initialBalance) {
    if (initialBalance < minBalance)
      throw MinimumBalanceViolationException('Premium needs ≥ \$10,000');
  }

  @override
  void withdraw(double amount) {
    _validateAmount(amount);
    if (_balance - amount < minBalance)
      throw InsufficientBalanceException('Below min \$10,000');
    _balance -= amount;
    _log('WITHDRAW', amount);
    print('✅ Withdrew \$${amount.toStringAsFixed(2)}');
  }

  @override
  void deposit(double amount) {
    _validateAmount(amount);
    _balance += amount;
    _log('DEPOSIT', amount);
    print('✅ Deposited \$${amount.toStringAsFixed(2)}');
  }

  @override
  double calculateInterest() => _balance * 0.05;
}