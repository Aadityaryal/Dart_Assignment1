import 'exceptions.dart';

abstract class BankAccount {
  final String _accountNumber;
  String _accountHolderName;
  double _balance;
  int _transactionCount = 0;
  final List<String> _transactionHistory = [];

  BankAccount(this._accountNumber, this._accountHolderName, this._balance);

  // GETTERS
  String get accountNumber => _accountNumber;
  String get accountHolderName => _accountHolderName;
  double get balance => _balance;
  int get transactionCount => _transactionCount;
  List<String> get transactionHistory => List.unmodifiable(_transactionHistory);

  // SETTER for balance (used by subclasses)
  set balance(double value) {
    if (value < 0) {
      throw InsufficientBalanceException('Balance cannot be negative');
    }
    _balance = value;
  }
  set accountHolderName(String name) {
    if (name.trim().isEmpty) throw ArgumentError('Name cannot be empty');
    _accountHolderName = name.trim();
  }

  // PUBLIC: validate amount
  void validateAmount(double amount) {
    if (amount <= 0) throw InvalidAmountException('Amount must be positive');
  }

  // PUBLIC: log transaction
  void log(String action, double amount) {
    _transactionHistory.add(
        '$action \$${amount.toStringAsFixed(2)} @ ${DateTime.now().toIso8601String().substring(0, 19)}');
    _transactionCount++;
  }

  // ABSTRACT
  void withdraw(double amount);
  void deposit(double amount);

  void displayInfo() {
    print('┌──────────────────────────────');
    print('│ Account #: $_accountNumber');
    print('│ Holder   : $_accountHolderName');
    print('│ Balance  : \$${balance.toStringAsFixed(2)}');
    print('│ Tx Count : $transactionCount');
    print('└──────────────────────────────');
  }

  void displayTransactionHistory() {
    print('Transaction History for $_accountNumber ($_accountHolderName):');
    if (_transactionHistory.isEmpty) {
      print('  No transactions yet.');
    } else {
      for (var tx in _transactionHistory) {
        print('  • $tx');
      }
    }
    print('');
  }
}