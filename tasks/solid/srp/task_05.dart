// SOLID - Single Responsibility Principle (Принцип единственной ответственности)
// Задача 5: Класс Logger - все в одном
//
// ПРОБЛЕМА В КОДЕ:
// Класс Logger форматирует сообщения, записывает в файл, отправляет уведомления
// и хранит историю. Слишком много ответственностей в одном классе!
//
// ЗАДАНИЕ:
// Разделите на классы:
// - LogMessage - данные лога (уровень, сообщение, время)
// - LogFormatter - форматирование сообщений
// - LogStorage - хранение логов (можно несколько реализаций)
// - LogNotifier - отправка уведомлений
// - Logger - координирует работу всех компонентов

// === КОД С НАРУШЕНИЕМ SRP ===

class Logger {
  List<String> logs = [];
  String filePath;
  String slackWebhook;

  Logger(this.filePath, this.slackWebhook);

  void log(String level, String message) {
    // Форматирование
    String timestamp = DateTime.now().toIso8601String();
    String formatted = '[$timestamp] [$level] $message';

    // Хранение в памяти
    logs.add(formatted);

    // Запись в файл
    _writeToFile(formatted);

    // Вывод в консоль
    print(formatted);

    // Отправка уведомления для критических ошибок
    if (level == 'ERROR' || level == 'CRITICAL') {
      _sendSlackNotification(formatted);
    }
  }

  void _writeToFile(String message) {
    print('Записываю в файл $filePath: $message');
    // Реальная запись в файл
  }

  void _sendSlackNotification(String message) {
    print('Отправляю в Slack ($slackWebhook): $message');
    // Реальная отправка в Slack
  }

  void info(String message) => log('INFO', message);
  void warning(String message) => log('WARNING', message);
  void error(String message) => log('ERROR', message);
  void critical(String message) => log('CRITICAL', message);

  List<String> getLogsByLevel(String level) {
    return logs.where((log) => log.contains('[$level]')).toList();
  }

  void clearLogs() {
    logs.clear();
    print('Логи очищены');
  }
}

void main() {
  var logger = Logger('/var/log/app.log', 'https://slack.com/webhook');

  logger.info('Приложение запущено');
  logger.warning('Низкий уровень памяти');
  logger.error('Не удалось подключиться к БД');
  logger.critical('Сервер не отвечает!');

  print('\n=== Только ошибки ===');
  for (var log in logger.getLogsByLevel('ERROR')) {
    print(log);
  }
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
