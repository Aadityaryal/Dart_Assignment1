import 'bank.dart';

void main() {
  final bank = Bank();


  // Create accounts
  bank.createAccount('savings', 'Alice', 2000);
  bank.createAccount('checking', 'Bob', 800);
  bank.createAccount('premium', 'Charlie', 30000);
  bank.createAccount('student', 'Diana', 3000);

  print('\n');

  // Operations
  try {
    bank.findAccount('ACC1001').deposit(500);
    bank.transfer('ACC1002', 'ACC1004', 200);
  } catch (e) {
    print('Error: $e');
  }

  // Apply interest
  bank.applyMonthlyInterest();

  // Reports
  bank.generateReport();
  bank.showTransactionHistory('ACC1001');

  print('System running perfectly!');
}