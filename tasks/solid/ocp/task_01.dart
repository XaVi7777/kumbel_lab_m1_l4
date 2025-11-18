// SOLID - Open/Closed Principle (Принцип открытости/закрытости)
// Задача 1: Калькулятор скидок
//
// ПРИНЦИП:
// Классы должны быть открыты для расширения, но закрыты для модификации.
// Новую функциональность добавляем через наследование/композицию, не меняя существующий код.
//
// ПРОБЛЕМА В КОДЕ:
// При добавлении нового типа скидки нужно модифицировать метод calculateDiscount().
// Каждый новый тип требует изменения switch/case.
//
// ЗАДАНИЕ:
// Создайте абстрактный класс Discount с методом calculate().
// Реализуйте отдельные классы для каждого типа скидки.
// Класс DiscountCalculator должен принимать Discount без знания конкретного типа.

// === КОД С НАРУШЕНИЕМ OCP ===

class DiscountCalculator {
  double calculateDiscount(String discountType, double amount) {
    switch (discountType) {
      case 'percentage':
        return amount * 0.1; // 10%
      case 'fixed':
        return 100; // фиксированная скидка
      case 'seasonal':
        return amount * 0.15; // 15% сезонная
      // При добавлении нового типа нужно менять этот метод!
      default:
        return 0;
    }
  }
}

void main() {
  var calculator = DiscountCalculator();

  double amount = 1000;

  print('Сумма: $amount руб.');
  print('Процентная скидка: ${calculator.calculateDiscount('percentage', amount)} руб.');
  print('Фиксированная скидка: ${calculator.calculateDiscount('fixed', amount)} руб.');
  print('Сезонная скидка: ${calculator.calculateDiscount('seasonal', amount)} руб.');
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
