// Решение OCP задачи 4: Обработка платежей

abstract class PaymentMethod {
  void process(double amount);
  void refund(String transactionId, double amount);
}

class CreditCard implements PaymentMethod {
  @override
  void process(double amount) {
    print('Обработка кредитной карты...');
    print('Проверка CVV...');
    print('Списание $amount руб.');
  }

  @override
  void refund(String transactionId, double amount) {
    print('Возврат на карту: $amount руб.');
  }
}

class PayPal implements PaymentMethod {
  @override
  void process(double amount) {
    print('Перенаправление на PayPal...');
    print('Авторизация...');
    print('Платеж $amount руб. выполнен');
  }

  @override
  void refund(String transactionId, double amount) {
    print('Возврат через PayPal: $amount руб.');
  }
}

class BankTransfer implements PaymentMethod {
  @override
  void process(double amount) {
    print('Генерация платежного поручения...');
    print('Ожидание подтверждения банка...');
    print('Перевод $amount руб. инициирован');
  }

  @override
  void refund(String transactionId, double amount) {
    print('Возврат банковским переводом: $amount руб.');
  }
}

class PaymentProcessor {
  void processPayment(PaymentMethod method, double amount) {
    method.process(amount);
  }

  void processRefund(PaymentMethod method, String transactionId, double amount) {
    method.refund(transactionId, amount);
  }
}

void main() {
  var processor = PaymentProcessor();

  print('=== Оплата картой ===');
  processor.processPayment(CreditCard(), 1000);

  print('\n=== Оплата через PayPal ===');
  processor.processPayment(PayPal(), 2000);

  print('\n=== Банковский перевод ===');
  processor.processPayment(BankTransfer(), 5000);
}
