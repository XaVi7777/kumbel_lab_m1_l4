// SOLID - Dependency Inversion Principle (Принцип инверсии зависимостей)
// Задача 3: Логирование в приложении
//
// ПРОБЛЕМА В КОДЕ:
// OrderProcessor создает FileLogger внутри себя.
// Нельзя логировать в консоль, базу данных или внешний сервис.
//
// ЗАДАНИЕ:
// Создайте интерфейс Logger с методом log().
// Реализуйте FileLogger, ConsoleLogger, DatabaseLogger.
// OrderProcessor должен получать Logger через конструктор.

// === КОД С НАРУШЕНИЕМ DIP ===

class FileLogger {
  void writeToFile(String message) {
    print('[FILE] $message');
    // Запись в файл
  }
}

class OrderProcessor {
  // Жесткая зависимость от FileLogger
  final FileLogger _logger = FileLogger();

  void processOrder(int orderId) {
    _logger.writeToFile('Начало обработки заказа $orderId');

    // Обработка заказа
    print('Обработка заказа $orderId...');

    _logger.writeToFile('Заказ $orderId успешно обработан');
  }

  void cancelOrder(int orderId) {
    _logger.writeToFile('Отмена заказа $orderId');
    print('Заказ $orderId отменен');
  }
}

void main() {
  var processor = OrderProcessor();

  processor.processOrder(1001);
  print('---');
  processor.cancelOrder(1002);

  // Как логировать в консоль для дебага?
  // Как логировать в БД для продакшена?
  // Как использовать разные логгеры для разных окружений?
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
