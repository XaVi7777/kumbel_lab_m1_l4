// Решение LSP задачи 5: Транспортные средства

abstract class Driveable {
  void drive();
  void stop();
}

abstract class HasEngine {
  void startEngine();
  void stopEngine();
}

abstract class Floatable {
  void sail();
}

class Car implements Driveable, HasEngine {
  String name;
  Car(this.name);

  @override
  void startEngine() => print('$name: Двигатель запущен');

  @override
  void stopEngine() => print('$name: Двигатель остановлен');

  @override
  void drive() => print('$name: Едет по дороге');

  @override
  void stop() => print('$name: Остановился');
}

class Bicycle implements Driveable {
  String name;
  Bicycle(this.name);

  @override
  void drive() => print('$name: Едет по дороге');

  @override
  void stop() => print('$name: Остановился');
}

class Boat implements HasEngine, Floatable {
  String name;
  Boat(this.name);

  @override
  void startEngine() => print('$name: Двигатель запущен');

  @override
  void stopEngine() => print('$name: Двигатель остановлен');

  @override
  void sail() => print('$name: Плывет по воде');
}

void startDriveables(List<Driveable> vehicles) {
  for (var vehicle in vehicles) {
    vehicle.drive();
  }
}

void startEngines(List<HasEngine> vehicles) {
  for (var vehicle in vehicles) {
    vehicle.startEngine();
  }
}

void main() {
  var car = Car('Машина');
  var bicycle = Bicycle('Велосипед');
  var boat = Boat('Лодка');

  print('=== Запуск двигателей ===');
  startEngines([car, boat]);

  print('\n=== Езда по дороге ===');
  startDriveables([car, bicycle]);

  print('\n=== Лодка плывет ===');
  boat.sail();
}
