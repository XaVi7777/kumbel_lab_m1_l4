// SOLID - Dependency Inversion Principle (Принцип инверсии зависимостей)
// Задача 4: Оплата заказов
//
// ПРОБЛЕМА В КОДЕ:
// CheckoutService напрямую использует StripePayment.
// Нельзя использовать PayPal, банковские переводы или тестовые платежи.
//
// ЗАДАНИЕ:
// Создайте интерфейс PaymentGateway.
// CheckoutService должен зависеть от абстракции PaymentGateway.
// Реализуйте несколько платежных систем.

// === КОД С НАРУШЕНИЕМ DIP ===

class StripePayment {
  void charge(String cardNumber, double amount) {
    print('Stripe: Списание $amount с карты $cardNumber');
    // API вызов к Stripe
  }

  void refund(String transactionId, double amount) {
    print('Stripe: Возврат $amount по транзакции $transactionId');
  }
}

class CheckoutService {
  // Жесткая зависимость от Stripe
  final StripePayment _payment = StripePayment();

  void checkout(String cardNumber, double amount) {
    print('Оформление заказа на сумму $amount');

    _payment.charge(cardNumber, amount);

    print('Заказ оплачен!');
  }

  void processRefund(String transactionId, double amount) {
    _payment.refund(transactionId, amount);
    print('Возврат оформлен');
  }
}

void main() {
  var checkout = CheckoutService();

  checkout.checkout('4111-1111-1111-1111', 1500);
  print('---');
  checkout.processRefund('txn_123', 500);

  // Как использовать PayPal?
  // Как тестировать без реальных платежей?
  // Как переключиться на другую платежную систему?
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
