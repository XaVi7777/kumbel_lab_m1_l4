// Решение OCP задачи 5: Система расчета доставки

abstract class ShippingMethod {
  String get name;
  double calculate(double weight, double distance);
  void validate(double weight, double distance);
  String getEstimatedTime(double distance);
}

class StandardShipping implements ShippingMethod {
  @override
  String get name => 'standard';

  @override
  void validate(double weight, double distance) {
    if (weight > 30) {
      throw Exception('Стандартная доставка: макс. вес 30 кг');
    }
  }

  @override
  double calculate(double weight, double distance) {
    validate(weight, distance);
    return 200 + (weight * 10) + (distance * 5);
  }

  @override
  String getEstimatedTime(double distance) {
    return '${(distance / 50).ceil()} дней';
  }
}

class ExpressShipping implements ShippingMethod {
  @override
  String get name => 'express';

  @override
  void validate(double weight, double distance) {
    if (weight > 20) {
      throw Exception('Экспресс доставка: макс. вес 20 кг');
    }
  }

  @override
  double calculate(double weight, double distance) {
    validate(weight, distance);
    return 400 + (weight * 20) + (distance * 10);
  }

  @override
  String getEstimatedTime(double distance) {
    return '${(distance / 100).ceil()} дней';
  }
}

class DroneDelivery implements ShippingMethod {
  @override
  String get name => 'drone';

  @override
  void validate(double weight, double distance) {
    if (weight > 5) {
      throw Exception('Дрон: макс. вес 5 кг');
    }
    if (distance > 10) {
      throw Exception('Дрон: макс. дистанция 10 км');
    }
  }

  @override
  double calculate(double weight, double distance) {
    validate(weight, distance);
    return 500;
  }

  @override
  String getEstimatedTime(double distance) {
    return '${(distance * 6).round()} минут';
  }
}

class ShippingCalculator {
  double calculate(ShippingMethod method, double weight, double distance) {
    return method.calculate(weight, distance);
  }
}

void main() {
  var calculator = ShippingCalculator();
  double weight = 3;
  double distance = 5;

  print('Вес: $weight кг, Дистанция: $distance км\n');

  var methods = [StandardShipping(), ExpressShipping(), DroneDelivery()];

  for (var method in methods) {
    try {
      var cost = calculator.calculate(method, weight, distance);
      var time = method.getEstimatedTime(distance);
      print('${method.name}: $cost руб., время: $time');
    } catch (e) {
      print('${method.name}: $e');
    }
  }
}
