// Решение DIP задачи 5: Система отчетов с DI

abstract class DataSource {
  Map<String, dynamic> fetchData(String query);
}

abstract class ReportGenerator {
  String generate(Map<String, dynamic> data);
}

abstract class ReportDelivery {
  void deliver(String recipient, String report);
}

// Реализации DataSource
class SqlDataSource implements DataSource {
  @override
  Map<String, dynamic> fetchData(String query) {
    print('SQL: Выполнение запроса "$query"');
    return {'revenue': 100000, 'orders': 150};
  }
}

class ApiDataSource implements DataSource {
  @override
  Map<String, dynamic> fetchData(String query) {
    print('API: Запрос данных "$query"');
    return {'revenue': 120000, 'orders': 180};
  }
}

// Реализации ReportGenerator
class PdfGenerator implements ReportGenerator {
  @override
  String generate(Map<String, dynamic> data) {
    print('PDF: Генерация отчета');
    return 'report.pdf';
  }
}

class ExcelGenerator implements ReportGenerator {
  @override
  String generate(Map<String, dynamic> data) {
    print('Excel: Генерация отчета');
    return 'report.xlsx';
  }
}

// Реализации ReportDelivery
class EmailDelivery implements ReportDelivery {
  @override
  void deliver(String recipient, String report) {
    print('Email: Отправка $report на $recipient');
  }
}

class TelegramDelivery implements ReportDelivery {
  @override
  void deliver(String recipient, String report) {
    print('Telegram: Отправка $report на $recipient');
  }
}

class ReportingService {
  final DataSource _dataSource;
  final ReportGenerator _generator;
  final ReportDelivery _delivery;

  ReportingService(this._dataSource, this._generator, this._delivery);

  void generateAndSendReport(String query, String recipient) {
    print('=== Создание отчета ===');

    var data = _dataSource.fetchData(query);
    var report = _generator.generate(data);
    _delivery.deliver(recipient, report);

    print('=== Отчет отправлен ===');
  }
}

void main() {
  print('SQL + PDF + Email:');
  var service1 = ReportingService(
    SqlDataSource(),
    PdfGenerator(),
    EmailDelivery(),
  );
  service1.generateAndSendReport('SELECT * FROM sales', 'manager@example.com');

  print('\nAPI + Excel + Telegram:');
  var service2 = ReportingService(
    ApiDataSource(),
    ExcelGenerator(),
    TelegramDelivery(),
  );
  service2.generateAndSendReport('monthly_stats', '@boss');
}
