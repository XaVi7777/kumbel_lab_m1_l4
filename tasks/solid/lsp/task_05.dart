// SOLID - Liskov Substitution Principle (Принцип подстановки Лисков)
// Задача 5: Транспортные средства
//
// ПРОБЛЕМА В КОДЕ:
// Vehicle имеет методы для всех видов транспорта, но:
// - Bicycle не имеет двигателя (startEngine бессмысленен)
// - Boat не ездит по дорогам (drive тоже)
// Подклассы выбрасывают исключения, нарушая LSP.
//
// ЗАДАНИЕ:
// Используйте композицию интерфейсов:
// - Driveable (drive, stop)
// - HasEngine (startEngine, stopEngine)
// - Floatable (sail)
// Каждый транспорт реализует только нужные интерфейсы.

// === КОД С НАРУШЕНИЕМ LSP ===

class Vehicle {
  String name;

  Vehicle(this.name);

  void startEngine() {
    print('$name: Двигатель запущен');
  }

  void stopEngine() {
    print('$name: Двигатель остановлен');
  }

  void drive() {
    print('$name: Едет по дороге');
  }

  void stop() {
    print('$name: Остановился');
  }
}

class Car extends Vehicle {
  Car(super.name);
}

class Bicycle extends Vehicle {
  Bicycle(super.name);

  @override
  void startEngine() {
    // Нарушение LSP! У велосипеда нет двигателя
    throw Exception('$name не имеет двигателя!');
  }

  @override
  void stopEngine() {
    throw Exception('$name не имеет двигателя!');
  }
}

class Boat extends Vehicle {
  Boat(super.name);

  @override
  void drive() {
    // Нарушение LSP! Лодка не ездит по дорогам
    throw Exception('$name не может ездить по дорогам!');
  }

  void sail() {
    print('$name: Плывет по воде');
  }
}

void startAllVehicles(List<Vehicle> vehicles) {
  for (var vehicle in vehicles) {
    vehicle.startEngine();
    vehicle.drive();
  }
}

void main() {
  var vehicles = [
    Car('Машина'),
    Bicycle('Велосипед'),
    Boat('Лодка'),
  ];

  try {
    startAllVehicles(vehicles);
  } catch (e) {
    print('Ошибка: $e');
  }
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
