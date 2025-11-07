import 'savings_account.dart';
import 'checking_account.dart';

void main() {
  // Test Savings
  final savings = SavingsAccount('TEST001', 'Alice', 1000.0);
  savings.deposit(200.0);
  savings.withdraw(100.0);
  savings.displayInfo();

  // Test Checking
  final checking = CheckingAccount('TEST002', 'Bob', 500.0);
  checking.deposit(100.0);
  checking.withdraw(700.0); // Should trigger overdraft
  checking.displayInfo();
}