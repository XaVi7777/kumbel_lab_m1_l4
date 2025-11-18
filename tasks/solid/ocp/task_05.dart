// SOLID - Open/Closed Principle (Принцип открытости/закрытости)
// Задача 5: Система расчета доставки
//
// ПРОБЛЕМА В КОДЕ:
// ShippingCalculator содержит всю логику расчета для разных способов доставки.
// Добавление нового способа или изменение тарифов требует модификации класса.
// Также логика валидации смешана с расчетом.
//
// ЗАДАНИЕ:
// Создайте абстрактный класс ShippingMethod с методами:
// - calculate(weight, distance) - расчет стоимости
// - validate(weight) - проверка ограничений
// Реализуйте StandardShipping, ExpressShipping, DroneDelivery.
// ShippingCalculator должен работать с любым методом доставки.

// === КОД С НАРУШЕНИЕМ OCP ===

class ShippingCalculator {
  double calculate(String method, double weight, double distance) {
    switch (method) {
      case 'standard':
        if (weight > 30) {
          throw Exception('Стандартная доставка: макс. вес 30 кг');
        }
        // Базовая ставка + за кг + за км
        return 200 + (weight * 10) + (distance * 5);

      case 'express':
        if (weight > 20) {
          throw Exception('Экспресс доставка: макс. вес 20 кг');
        }
        // Дороже в 2 раза
        return 400 + (weight * 20) + (distance * 10);

      case 'drone':
        if (weight > 5) {
          throw Exception('Дрон: макс. вес 5 кг');
        }
        if (distance > 10) {
          throw Exception('Дрон: макс. дистанция 10 км');
        }
        // Фиксированная цена
        return 500;

      // Новый способ доставки? Меняем этот код!
      default:
        throw Exception('Неизвестный способ доставки');
    }
  }

  String getEstimatedTime(String method, double distance) {
    switch (method) {
      case 'standard':
        return '${(distance / 50).ceil()} дней';
      case 'express':
        return '${(distance / 100).ceil()} дней';
      case 'drone':
        return '${(distance * 6).round()} минут';
      default:
        return 'Неизвестно';
    }
  }
}

void main() {
  var calculator = ShippingCalculator();

  double weight = 3;
  double distance = 5;

  print('Вес: $weight кг, Дистанция: $distance км\n');

  for (var method in ['standard', 'express', 'drone']) {
    try {
      var cost = calculator.calculate(method, weight, distance);
      var time = calculator.getEstimatedTime(method, distance);
      print('$method: $cost руб., время: $time');
    } catch (e) {
      print('$method: $e');
    }
  }
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
