// Решение LSP задачи 4: Банковские счета

abstract class Account {
  String accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Пополнение: +$amount. Баланс: $balance');
  }

  double getBalance() => balance;
}

abstract class WithdrawableAccount extends Account {
  WithdrawableAccount(super.accountNumber, super.balance);

  void withdraw(double amount) {
    if (amount > balance) {
      throw Exception('Недостаточно средств');
    }
    balance -= amount;
    print('Снятие: -$amount. Баланс: $balance');
  }
}

class SavingsAccount extends WithdrawableAccount {
  SavingsAccount(super.accountNumber, super.balance);

  @override
  void withdraw(double amount) {
    double fee = amount * 0.01;
    super.withdraw(amount + fee);
    print('(включая комиссию $fee)');
  }
}

class FixedDepositAccount extends Account {
  DateTime maturityDate;

  FixedDepositAccount(super.accountNumber, super.balance, this.maturityDate);

  bool canWithdraw() => DateTime.now().isAfter(maturityDate);
}

void processWithdrawal(WithdrawableAccount account, double amount) {
  print('Обработка снятия $amount с ${account.accountNumber}');
  account.withdraw(amount);
}

void main() {
  var savings = SavingsAccount('SAV-001', 1000);
  var fixed = FixedDepositAccount(
    'FIX-001',
    5000,
    DateTime.now().add(Duration(days: 365)),
  );

  print('=== Сберегательный счет ===');
  processWithdrawal(savings, 100);

  print('\n=== Фиксированный депозит ===');
  print('Можно снять: ${fixed.canWithdraw()}');
  print('Баланс: ${fixed.getBalance()}');
}
