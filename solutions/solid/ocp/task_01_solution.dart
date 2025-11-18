// Решение OCP задачи 1: Калькулятор скидок

abstract class Discount {
  double calculate(double amount);
}

class PercentageDiscount implements Discount {
  @override
  double calculate(double amount) => amount * 0.1;
}

class FixedDiscount implements Discount {
  @override
  double calculate(double amount) => 100;
}

class SeasonalDiscount implements Discount {
  @override
  double calculate(double amount) => amount * 0.15;
}

// Можно легко добавить новую скидку без изменения существующего кода
class LoyaltyDiscount implements Discount {
  @override
  double calculate(double amount) => amount * 0.25;
}

class DiscountCalculator {
  double calculateDiscount(Discount discount, double amount) {
    return discount.calculate(amount);
  }
}

void main() {
  var calculator = DiscountCalculator();
  double amount = 1000;

  print('Сумма: $amount руб.');
  print('Процентная скидка: ${calculator.calculateDiscount(PercentageDiscount(), amount)} руб.');
  print('Фиксированная скидка: ${calculator.calculateDiscount(FixedDiscount(), amount)} руб.');
  print('Сезонная скидка: ${calculator.calculateDiscount(SeasonalDiscount(), amount)} руб.');
  print('Скидка лояльности: ${calculator.calculateDiscount(LoyaltyDiscount(), amount)} руб.');
}
