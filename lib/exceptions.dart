// ──────────────────────────────────────────────────────────────
// Custom Exceptions
// ──────────────────────────────────────────────────────────────
class InsufficientBalanceException implements Exception {
  final String message;
  InsufficientBalanceException(this.message);
}

class WithdrawalLimitExceededException implements Exception {
  final String message;
  WithdrawalLimitExceededException(this.message);
}

class MinimumBalanceViolationException implements Exception {
  final String message;
  MinimumBalanceViolationException(this.message);
}

class MaximumBalanceViolationException implements Exception {
  final String message;
  MaximumBalanceViolationException(this.message);
}

class InvalidAmountException implements Exception {
  final String message;
  InvalidAmountException(this.message);
}

class AccountNotFoundException implements Exception {
  final String message;
  AccountNotFoundException(this.message);
}