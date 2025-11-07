import 'bank_account.dart';
import 'interest_bearing.dart';
import 'exceptions.dart';

class SavingsAccount extends BankAccount implements InterestBearing {
  static const double minBalance = 500.0;
  static const int maxWithdrawalsPerMonth = 3;
  int _withdrawalsThisMonth = 0;

  SavingsAccount(String accountNumber, String holder, double initialBalance)
      : super(accountNumber, holder, initialBalance) {
    if (initialBalance < minBalance) {
      throw MinimumBalanceViolationException('Initial balance ≥ \$500 required');
    }
  }

  @override
  void withdraw(double amount) {
    validateAmount(amount);
    if (_withdrawalsThisMonth >= maxWithdrawalsPerMonth) {
      throw WithdrawalLimitExceededException('Max 3 withdrawals/month');
    }
    if (balance - amount < minBalance) {
      throw InsufficientBalanceException('Below min balance \$500');
    }
    balance -= amount;
    _withdrawalsThisMonth++;
    log('WITHDRAW', amount);
    print('Success: Withdrew \$${amount.toStringAsFixed(2)}');
  }

  @override
  void deposit(double amount) {
    validateAmount(amount);
    balance += amount;
    log('DEPOSIT', amount);
    print('Success: Deposited \$${amount.toStringAsFixed(2)}');
  }

  @override
  double calculateInterest() => balance * 0.02;

  void resetMonthlyWithdrawals() => _withdrawalsThisMonth = 0;
}