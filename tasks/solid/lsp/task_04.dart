// SOLID - Liskov Substitution Principle (Принцип подстановки Лисков)
// Задача 4: Банковские счета с ограничениями
//
// ПРОБЛЕМА В КОДЕ:
// FixedDepositAccount наследует BankAccount, но withdraw() запрещен.
// Это нарушает ожидания кода, работающего с BankAccount.
//
// ЗАДАНИЕ:
// Создайте базовый класс Account и разделите на:
// - WithdrawableAccount - счета с возможностью снятия
// - DepositOnlyAccount - счета только для депозита

// === КОД С НАРУШЕНИЕМ LSP ===

class BankAccount {
  String accountNumber;
  double balance;

  BankAccount(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Пополнение: +$amount. Баланс: $balance');
  }

  void withdraw(double amount) {
    if (amount > balance) {
      throw Exception('Недостаточно средств');
    }
    balance -= amount;
    print('Снятие: -$amount. Баланс: $balance');
  }

  double getBalance() => balance;
}

class SavingsAccount extends BankAccount {
  SavingsAccount(super.accountNumber, super.balance);

  @override
  void withdraw(double amount) {
    // Комиссия за снятие
    double fee = amount * 0.01;
    super.withdraw(amount + fee);
    print('(включая комиссию $fee)');
  }
}

class FixedDepositAccount extends BankAccount {
  DateTime maturityDate;

  FixedDepositAccount(super.accountNumber, super.balance, this.maturityDate);

  @override
  void withdraw(double amount) {
    // Нарушение LSP! Снятие запрещено до срока
    if (DateTime.now().isBefore(maturityDate)) {
      throw Exception('Снятие запрещено до $maturityDate');
    }
    super.withdraw(amount);
  }
}

void processWithdrawal(BankAccount account, double amount) {
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
  try {
    processWithdrawal(fixed, 100); // Ошибка!
  } catch (e) {
    print('Ошибка: $e');
  }
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
