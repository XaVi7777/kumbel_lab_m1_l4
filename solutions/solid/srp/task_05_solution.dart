// Решение SRP задачи 5: Разделение Logger на компоненты

class LogMessage {
  final String level;
  final String message;
  final DateTime timestamp;

  LogMessage(this.level, this.message) : timestamp = DateTime.now();
}

class LogFormatter {
  String format(LogMessage log) {
    return '[${log.timestamp.toIso8601String()}] [${log.level}] ${log.message}';
  }
}

abstract class LogStorage {
  void store(String formattedLog);
  List<String> getLogs();
}

class MemoryStorage implements LogStorage {
  final List<String> _logs = [];

  @override
  void store(String formattedLog) {
    _logs.add(formattedLog);
  }

  @override
  List<String> getLogs() => _logs;
}

class LogNotifier {
  final String slackWebhook;

  LogNotifier(this.slackWebhook);

  void notify(String message) {
    print('Отправляю в Slack ($slackWebhook): $message');
  }
}

class Logger {
  final LogFormatter _formatter;
  final LogStorage _storage;
  final LogNotifier? _notifier;

  Logger(this._formatter, this._storage, [this._notifier]);

  void log(String level, String message) {
    var logMessage = LogMessage(level, message);
    var formatted = _formatter.format(logMessage);

    _storage.store(formatted);
    print(formatted);

    if ((level == 'ERROR' || level == 'CRITICAL') && _notifier != null) {
      _notifier.notify(formatted);
    }
  }

  void info(String message) => log('INFO', message);
  void warning(String message) => log('WARNING', message);
  void error(String message) => log('ERROR', message);
  void critical(String message) => log('CRITICAL', message);

  List<String> getLogsByLevel(String level) {
    return _storage.getLogs().where((log) => log.contains('[$level]')).toList();
  }
}

void main() {
  var formatter = LogFormatter();
  var storage = MemoryStorage();
  var notifier = LogNotifier('https://slack.com/webhook');
  var logger = Logger(formatter, storage, notifier);

  logger.info('Приложение запущено');
  logger.warning('Низкий уровень памяти');
  logger.error('Не удалось подключиться к БД');
  logger.critical('Сервер не отвечает!');

  print('\n=== Только ошибки ===');
  for (var log in logger.getLogsByLevel('ERROR')) {
    print(log);
  }
}
