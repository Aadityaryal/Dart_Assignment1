import 'bank_account.dart';
import 'savings_account.dart';
import 'checking_account.dart';
import 'premium_account.dart';
import 'student_account.dart';
import 'interest_bearing.dart';
import 'exceptions.dart';

class Bank {
  final List<BankAccount> _accounts = [];
  int _nextAccountId = 1001;

  String _generateAccountNumber() => 'ACC${_nextAccountId++}';

  void createAccount(String type, String holder, double initialDeposit) {
    final accNumber = _generateAccountNumber();
    BankAccount account;

    switch (type.toLowerCase()) {
      case 'savings':
        account = SavingsAccount(accNumber, holder, initialDeposit);
        break;
      case 'checking':
        account = CheckingAccount(accNumber, holder, initialDeposit);
        break;
      case 'premium':
        account = PremiumAccount(accNumber, holder, initialDeposit);
        break;
      case 'student':
        account = StudentAccount(accNumber, holder, initialDeposit);
        break;
      default:
        throw ArgumentError('Invalid type: $type');
    }

    _accounts.add(account);
    print('🎉 Created $type → $accNumber');
  }

  BankAccount _findAccount(String accNumber) {
    return _accounts.firstWhere((a) => a.accountNumber == accNumber,
        orElse: () => throw AccountNotFoundException('Account $accNumber not found'));
  }

  void transfer(String fromAcc, String toAcc, double amount) {
    final from = _findAccount(fromAcc);
    final to = _findAccount(toAcc);
    from.withdraw(amount);
    to.deposit(amount);
    print('💸 Transferred \$${amount.toStringAsFixed(2)}: $fromAcc → $toAcc');
  }

  // FIXED METHOD: Cast to InterestBearing
  void applyMonthlyInterest() {
    print('Applying monthly interest...');
    for (var acc in _accounts) {
      if (acc is InterestBearing) {
        final interest = (acc as InterestBearing).calculateInterest(); // ← FIXED!
        acc.deposit(interest);
        print('   Interest \$${interest.toStringAsFixed(2)} → ${acc.accountNumber}');
      }
    }
  }

  void generateReport() {
    print('\n' + '=' * 50);
    print('           BANK REPORT');
    print('=' * 50);
    if (_accounts.isEmpty) {
      print('No accounts.\n');
      return;
    }
    for (var acc in _accounts) acc.displayInfo();
    print('=' * 50 + '\n');
  }

  void showTransactionHistory(String accNumber) {
    _findAccount(accNumber).displayTransactionHistory();
  }
}