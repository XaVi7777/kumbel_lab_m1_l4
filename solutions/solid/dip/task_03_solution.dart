// Решение DIP задачи 3: Логирование в приложении

abstract class Logger {
  void log(String message);
}

class FileLogger implements Logger {
  @override
  void log(String message) {
    print('[FILE] $message');
  }
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print('[CONSOLE] $message');
  }
}

class DatabaseLogger implements Logger {
  @override
  void log(String message) {
    print('[DB] $message');
  }
}

class OrderProcessor {
  final Logger _logger;

  OrderProcessor(this._logger);

  void processOrder(int orderId) {
    _logger.log('Начало обработки заказа $orderId');
    print('Обработка заказа $orderId...');
    _logger.log('Заказ $orderId успешно обработан');
  }

  void cancelOrder(int orderId) {
    _logger.log('Отмена заказа $orderId');
    print('Заказ $orderId отменен');
  }
}

void main() {
  print('=== Логирование в консоль (debug) ===');
  var debugProcessor = OrderProcessor(ConsoleLogger());
  debugProcessor.processOrder(1001);

  print('\n=== Логирование в файл (production) ===');
  var prodProcessor = OrderProcessor(FileLogger());
  prodProcessor.cancelOrder(1002);

  print('\n=== Логирование в БД ===');
  var dbProcessor = OrderProcessor(DatabaseLogger());
  dbProcessor.processOrder(1003);
}
