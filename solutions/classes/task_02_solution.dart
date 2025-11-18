// Решение задачи 2: Геттеры и сеттеры

class BankAccount {
  double _balance;

  BankAccount(this._balance);

  double get balance => _balance;

  set balance(double value) {
    if (value >= 0) {
      _balance = value;
    }
  }

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }
}

void main() {
  var account = BankAccount(100.0);

  print('Начальный баланс: ${account.balance}');

  account.deposit(50);
  print('После пополнения на 50: ${account.balance}');

  account.balance = -100; // Попытка установить отрицательный баланс
  print('Попытка установить отрицательный баланс: ${account.balance}');
}
