// SOLID - Interface Segregation Principle (Принцип разделения интерфейсов)
// Задача 5: Система умного дома
//
// ПРОБЛЕМА В КОДЕ:
// SmartDevice объединяет все возможности: включение, яркость, температура, расписание.
// SmartLight не имеет температуры, SmartThermostat не имеет яркости.
// Много пустых реализаций с UnimplementedError.
//
// ЗАДАНИЕ:
// Создайте мелкие интерфейсы:
// - Switchable (turnOn, turnOff, isOn)
// - Dimmable (setBrightness, getBrightness)
// - TemperatureControllable (setTemperature, getTemperature)
// - Schedulable (setSchedule, getSchedule)
// Каждое устройство реализует только нужные интерфейсы.

// === КОД С НАРУШЕНИЕМ ISP ===

abstract class SmartDevice {
  String get name;

  // Питание
  void turnOn();
  void turnOff();
  bool isOn();

  // Яркость
  void setBrightness(int level);
  int getBrightness();

  // Температура
  void setTemperature(double temp);
  double getTemperature();

  // Расписание
  void setSchedule(String schedule);
  String getSchedule();
}

class SmartLight implements SmartDevice {
  @override
  final String name;
  bool _isOn = false;
  int _brightness = 100;

  SmartLight(this.name);

  @override
  void turnOn() {
    _isOn = true;
    print('$name включен');
  }

  @override
  void turnOff() {
    _isOn = false;
    print('$name выключен');
  }

  @override
  bool isOn() => _isOn;

  @override
  void setBrightness(int level) {
    _brightness = level;
    print('$name: яркость $level%');
  }

  @override
  int getBrightness() => _brightness;

  @override
  void setTemperature(double temp) {
    throw UnimplementedError('Лампа не контролирует температуру');
  }

  @override
  double getTemperature() {
    throw UnimplementedError('Лампа не контролирует температуру');
  }

  @override
  void setSchedule(String schedule) {
    throw UnimplementedError('Эта лампа не поддерживает расписание');
  }

  @override
  String getSchedule() {
    throw UnimplementedError('Эта лампа не поддерживает расписание');
  }
}

class SmartThermostat implements SmartDevice {
  @override
  final String name;
  bool _isOn = false;
  double _temperature = 22.0;
  String _schedule = '';

  SmartThermostat(this.name);

  @override
  void turnOn() {
    _isOn = true;
    print('$name включен');
  }

  @override
  void turnOff() {
    _isOn = false;
    print('$name выключен');
  }

  @override
  bool isOn() => _isOn;

  @override
  void setBrightness(int level) {
    throw UnimplementedError('Термостат не имеет яркости');
  }

  @override
  int getBrightness() {
    throw UnimplementedError('Термостат не имеет яркости');
  }

  @override
  void setTemperature(double temp) {
    _temperature = temp;
    print('$name: температура $temp°C');
  }

  @override
  double getTemperature() => _temperature;

  @override
  void setSchedule(String schedule) {
    _schedule = schedule;
    print('$name: расписание установлено');
  }

  @override
  String getSchedule() => _schedule;
}

void main() {
  var light = SmartLight('Люстра');
  var thermo = SmartThermostat('Термостат');

  light.turnOn();
  light.setBrightness(75);

  thermo.turnOn();
  thermo.setTemperature(24);

  try {
    light.setTemperature(20); // Ошибка!
  } catch (e) {
    print('Ошибка: $e');
  }
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
