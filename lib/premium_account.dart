import 'bank_account.dart';
import 'interest_bearing.dart';
import 'exceptions.dart';

class PremiumAccount extends BankAccount implements InterestBearing {
  static const double minBalance = 10000.0;

  PremiumAccount(String accountNumber, String holder, double initialBalance)
      : super(accountNumber, holder, initialBalance) {
    if (initialBalance < minBalance) {
      throw MinimumBalanceViolationException('Premium needs ≥ \$10,000');
    }
  }

  @override
  void withdraw(double amount) {
    validateAmount(amount);
    if (balance - amount < minBalance) {
      throw InsufficientBalanceException('Below min \$10,000');
    }
    balance = balance - amount;
    log('WITHDRAW', amount);
    print('Success: Withdrew \$${amount.toStringAsFixed(2)}');
  }

  @override
  void deposit(double amount) {
    validateAmount(amount);
    balance = balance + amount;
    log('DEPOSIT', amount);
    print('Success: Deposited \$${amount.toStringAsFixed(2)}');
  }

  @override
  double calculateInterest() => balance * 0.05;
}