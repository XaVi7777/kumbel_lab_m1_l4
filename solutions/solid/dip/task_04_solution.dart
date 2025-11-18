// Решение DIP задачи 4: Оплата заказов

abstract class PaymentGateway {
  void charge(String paymentDetails, double amount);
  void refund(String transactionId, double amount);
}

class StripeGateway implements PaymentGateway {
  @override
  void charge(String paymentDetails, double amount) {
    print('Stripe: Списание $amount с $paymentDetails');
  }

  @override
  void refund(String transactionId, double amount) {
    print('Stripe: Возврат $amount по транзакции $transactionId');
  }
}

class PayPalGateway implements PaymentGateway {
  @override
  void charge(String paymentDetails, double amount) {
    print('PayPal: Платеж $amount выполнен');
  }

  @override
  void refund(String transactionId, double amount) {
    print('PayPal: Возврат $amount');
  }
}

class MockGateway implements PaymentGateway {
  @override
  void charge(String paymentDetails, double amount) {
    print('Mock: Тестовый платеж $amount');
  }

  @override
  void refund(String transactionId, double amount) {
    print('Mock: Тестовый возврат $amount');
  }
}

class CheckoutService {
  final PaymentGateway _gateway;

  CheckoutService(this._gateway);

  void checkout(String paymentDetails, double amount) {
    print('Оформление заказа на сумму $amount');
    _gateway.charge(paymentDetails, amount);
    print('Заказ оплачен!');
  }

  void processRefund(String transactionId, double amount) {
    _gateway.refund(transactionId, amount);
    print('Возврат оформлен');
  }
}

void main() {
  print('=== Production: Stripe ===');
  var stripeCheckout = CheckoutService(StripeGateway());
  stripeCheckout.checkout('4111-1111-1111-1111', 1500);

  print('\n=== Production: PayPal ===');
  var paypalCheckout = CheckoutService(PayPalGateway());
  paypalCheckout.checkout('user@paypal.com', 2000);

  print('\n=== Testing: Mock ===');
  var testCheckout = CheckoutService(MockGateway());
  testCheckout.checkout('test-card', 100);
}
