// SOLID - Single Responsibility Principle (Принцип единственной ответственности)
// Задача 3: Класс Order обрабатывает заказ и платежи
//
// ПРОБЛЕМА В КОДЕ:
// Класс Order содержит логику заказа, расчета скидок и обработки платежей.
// Изменения в любой из этих областей потребуют изменения класса Order.
//
// ЗАДАНИЕ:
// Разделите на классы:
// - Order - данные заказа
// - DiscountCalculator - расчет скидок
// - PaymentProcessor - обработка платежей

// === КОД С НАРУШЕНИЕМ SRP ===

class Order {
  List<Map<String, dynamic>> items = [];
  String customerType; // 'regular', 'vip', 'wholesale'

  Order(this.customerType);

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

  // Логика расчета скидок - отдельная ответственность!
  double calculateDiscount() {
    double total = calculateTotal();
    switch (customerType) {
      case 'vip':
        return total * 0.2; // 20% скидка
      case 'wholesale':
        return total * 0.3; // 30% скидка
      default:
        return total * 0.05; // 5% скидка
    }
  }

  // Логика платежей - еще одна ответственность!
  void processPayment(String method) {
    double finalAmount = calculateTotal() - calculateDiscount();

    switch (method) {
      case 'card':
        print('Обработка картой: $finalAmount руб.');
        print('Комиссия: ${finalAmount * 0.02} руб.');
        break;
      case 'cash':
        print('Оплата наличными: $finalAmount руб.');
        break;
      case 'crypto':
        print('Оплата криптовалютой: $finalAmount руб.');
        break;
    }
  }
}

void main() {
  var order = Order('vip');
  order.addItem('Ноутбук', 50000, 1);
  order.addItem('Мышь', 1500, 2);

  print('Сумма заказа: ${order.calculateTotal()} руб.');
  print('Скидка: ${order.calculateDiscount()} руб.');
  order.processPayment('card');
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
