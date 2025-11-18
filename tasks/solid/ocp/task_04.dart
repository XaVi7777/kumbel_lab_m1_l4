// SOLID - Open/Closed Principle (Принцип открытости/закрытости)
// Задача 4: Обработка платежей
//
// ПРОБЛЕМА В КОДЕ:
// PaymentProcessor содержит логику для всех типов платежей.
// Добавление нового типа (ApplePay, GooglePay) требует изменения класса.
//
// ЗАДАНИЕ:
// Создайте абстрактный класс PaymentMethod с методом process().
// Реализуйте CreditCard, PayPal, BankTransfer.
// PaymentProcessor должен работать с любым PaymentMethod.

// === КОД С НАРУШЕНИЕМ OCP ===

class PaymentProcessor {
  void processPayment(String method, double amount) {
    switch (method) {
      case 'credit_card':
        print('Обработка кредитной карты...');
        print('Проверка CVV...');
        print('Списание $amount руб.');
        break;

      case 'paypal':
        print('Перенаправление на PayPal...');
        print('Авторизация...');
        print('Платеж $amount руб. выполнен');
        break;

      case 'bank_transfer':
        print('Генерация платежного поручения...');
        print('Ожидание подтверждения банка...');
        print('Перевод $amount руб. инициирован');
        break;

      // Каждый новый метод = изменение этого кода
    }
  }
}

void main() {
  var processor = PaymentProcessor();

  print('=== Оплата картой ===');
  processor.processPayment('credit_card', 1000);

  print('\n=== Оплата через PayPal ===');
  processor.processPayment('paypal', 2000);

  print('\n=== Банковский перевод ===');
  processor.processPayment('bank_transfer', 5000);
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
