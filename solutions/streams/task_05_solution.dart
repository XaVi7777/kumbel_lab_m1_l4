// Решение задачи 5: Система мониторинга датчиков

import 'dart:async';
import 'dart:math';

class Sensor {
  final String name;
  final StreamController<double> _controller = StreamController<double>();
  Timer? _timer;
  final Random _random = Random();

  Sensor(this.name);

  Stream<double> get stream => _controller.stream;

  void startReading() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      var value = _random.nextDouble() * 100;
      _controller.add(value);
    });
  }

  void stop() {
    _timer?.cancel();
    _controller.close();
  }
}

class Monitor {
  final List<Sensor> sensors;

  Monitor(this.sensors);

  void startMonitoring() {
    for (var sensor in sensors) {
      sensor.startReading();

      sensor.stream.listen((value) {
        var valueStr = value.toStringAsFixed(1);
        if (value > 80) {
          print('[${sensor.name}] Показание: $valueStr КРИТИЧЕСКОЕ!');
        } else {
          print('[${sensor.name}] Показание: $valueStr');
        }
      });
    }
  }

  void stopAll() {
    for (var sensor in sensors) {
      sensor.stop();
    }
    print('Мониторинг остановлен.');
  }
}

void main() {
  var sensors = [
    Sensor('Температура'),
    Sensor('Давление'),
    Sensor('Влажность'),
  ];

  var monitor = Monitor(sensors);

  print('Запуск мониторинга...');
  monitor.startMonitoring();

  // Останавливаем через 5 секунд
  Future.delayed(Duration(seconds: 5), () {
    monitor.stopAll();
  });
}
