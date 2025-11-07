// lib/student_account.dart
import 'bank_account.dart';
import 'exceptions.dart';

/// A special account for students – no fees, but a hard $5,000 limit.
class StudentAccount extends BankAccount {
  static const double maxBalance = 5000.0;

  StudentAccount(String accountNumber, String holder, double initialBalance)
      : super(accountNumber, holder, initialBalance) {
    // Initial deposit must not exceed the limit
    if (initialBalance > maxBalance) {
      throw MaximumBalanceViolationException('Max \$5,000 for student');
    }
  }

  @override
  void withdraw(double amount) {
    validateAmount(amount);

    // Not allowed to go negative
    if (balance - amount < 0) {
      throw InsufficientBalanceException('Insufficient funds');
    }

    balance = balance - amount;   // use the public setter
    log('WITHDRAW', amount);
    print('Success: Withdrew \$${amount.toStringAsFixed(2)}');
  }

  @override
  void deposit(double amount) {
    validateAmount(amount);

    // Cannot exceed the $5,000 ceiling
    if (balance + amount > maxBalance) {
      throw MaximumBalanceViolationException('Cannot exceed \$5,000');
    }

    balance = balance + amount;
    log('DEPOSIT', amount);
    print('Success: Deposited \$${amount.toStringAsFixed(2)}');
  }
}