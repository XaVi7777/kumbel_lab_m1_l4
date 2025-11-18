// Решение задачи 5: Фабричный конструктор и Singleton

class Logger {
  static final Logger _instance = Logger._internal();
  final List<String> logs = [];

  Logger._internal();

  factory Logger() {
    return _instance;
  }

  void log(String message) {
    var timestamp = DateTime.now().toIso8601String();
    logs.add('[$timestamp] $message');
  }

  void printLogs() {
    print('--- Все логи ---');
    for (var log in logs) {
      print(log);
    }
  }
}

void main() {
  var logger1 = Logger();
  var logger2 = Logger();

  print('Это один и тот же объект: ${identical(logger1, logger2)}');

  logger1.log('Сообщение от logger1');
  logger2.log('Сообщение от logger2');
  logger1.log('Еще одно сообщение');

  logger1.printLogs();
}
