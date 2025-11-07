import 'savings_account.dart';
import 'checking_account.dart';
import 'premium_account.dart';
import 'student_account.dart';

void main() {
  print('🏦 DartBank OOP System – Step 3: Added Premium and Student');

  // Previous tests...
  final savings = SavingsAccount('TEST001', 'Alice', 1000.0);
  savings.deposit(200.0);
  savings.withdraw(100.0);
  savings.displayInfo();
  print('Savings Interest: \$${savings.calculateInterest().toStringAsFixed(2)}');

  final checking = CheckingAccount('TEST002', 'Bob', 500.0);
  checking.deposit(100.0);
  checking.withdraw(700.0);
  checking.displayInfo();

  // New tests
  final premium = PremiumAccount('TEST003', 'Charlie', 15000.0);
  premium.deposit(5000.0);
  premium.withdraw(2000.0);
  premium.displayInfo();
  print('Premium Interest: \$${premium.calculateInterest().toStringAsFixed(2)}');

  final student = StudentAccount('TEST004', 'Diana', 3000.0);
  student.deposit(1000.0);
  student.withdraw(500.0);
  student.displayInfo();
}