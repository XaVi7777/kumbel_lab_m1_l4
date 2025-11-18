// Решение SRP задачи 3: Разделение Order, DiscountCalculator, PaymentProcessor

class Order {
  List<Map<String, dynamic>> items = [];

  void addItem(String name, double price, int quantity) {
    items.add({'name': name, 'price': price, 'quantity': quantity});
  }

  double calculateTotal() {
    double total = 0;
    for (var item in items) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }
}

class DiscountCalculator {
  double calculateDiscount(double total, String customerType) {
    switch (customerType) {
      case 'vip':
        return total * 0.2;
      case 'wholesale':
        return total * 0.3;
      default:
        return total * 0.05;
    }
  }
}

class PaymentProcessor {
  void processPayment(String method, double amount) {
    switch (method) {
      case 'card':
        print('Обработка картой: $amount руб.');
        print('Комиссия: ${amount * 0.02} руб.');
        break;
      case 'cash':
        print('Оплата наличными: $amount руб.');
        break;
      case 'crypto':
        print('Оплата криптовалютой: $amount руб.');
        break;
    }
  }
}

void main() {
  var order = Order();
  order.addItem('Ноутбук', 50000, 1);
  order.addItem('Мышь', 1500, 2);

  var discountCalc = DiscountCalculator();
  var paymentProc = PaymentProcessor();

  var total = order.calculateTotal();
  var discount = discountCalc.calculateDiscount(total, 'vip');
  var finalAmount = total - discount;

  print('Сумма заказа: $total руб.');
  print('Скидка: $discount руб.');
  paymentProc.processPayment('card', finalAmount);
}
