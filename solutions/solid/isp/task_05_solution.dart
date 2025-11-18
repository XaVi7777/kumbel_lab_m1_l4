// Решение ISP задачи 5: Система умного дома

abstract class Switchable {
  void turnOn();
  void turnOff();
  bool isOn();
}

abstract class Dimmable {
  void setBrightness(int level);
  int getBrightness();
}

abstract class TemperatureControllable {
  void setTemperature(double temp);
  double getTemperature();
}

abstract class Schedulable {
  void setSchedule(String schedule);
  String getSchedule();
}

class SmartLight implements Switchable, Dimmable {
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
}

class SmartThermostat implements Switchable, TemperatureControllable, Schedulable {
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
  thermo.setSchedule('08:00-22:00');
}
