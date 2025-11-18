// SOLID - Dependency Inversion Principle (Принцип инверсии зависимостей)
// Задача 5: Система отчетов с множеством зависимостей
//
// ПРОБЛЕМА В КОДЕ:
// ReportingService имеет жесткие зависимости от конкретных реализаций:
// - SqlDataSource для данных
// - PdfGenerator для генерации
// - SmtpEmailer для отправки
// Невозможно использовать другие источники данных, форматы или способы доставки.
//
// ЗАДАНИЕ:
// Создайте абстракции:
// - DataSource (fetchData)
// - ReportGenerator (generate)
// - ReportDelivery (deliver)
// ReportingService должен принимать все зависимости через конструктор.
// Реализуйте несколько вариантов каждой абстракции.

// === КОД С НАРУШЕНИЕМ DIP ===

class SqlDataSource {
  Map<String, dynamic> fetchData(String query) {
    print('SQL: Выполнение запроса "$query"');
    return {'revenue': 100000, 'orders': 150};
  }
}

class PdfGenerator {
  String generate(Map<String, dynamic> data) {
    print('PDF: Генерация отчета');
    return 'report.pdf';
  }
}

class SmtpEmailer {
  void send(String to, String attachment) {
    print('SMTP: Отправка $attachment на $to');
  }
}

class ReportingService {
  // Три жесткие зависимости!
  final SqlDataSource _dataSource = SqlDataSource();
  final PdfGenerator _generator = PdfGenerator();
  final SmtpEmailer _emailer = SmtpEmailer();

  void generateAndSendReport(String query, String recipient) {
    print('=== Создание отчета ===');

    // 1. Получение данных
    var data = _dataSource.fetchData(query);

    // 2. Генерация отчета
    var report = _generator.generate(data);

    // 3. Отправка отчета
    _emailer.send(recipient, report);

    print('=== Отчет отправлен ===');
  }
}

void main() {
  var service = ReportingService();

  service.generateAndSendReport(
    'SELECT * FROM sales WHERE month = 11',
    'manager@example.com',
  );

  // Как получить данные из API вместо SQL?
  // Как сгенерировать Excel вместо PDF?
  // Как отправить через Telegram вместо Email?
  // Как протестировать без реальных сервисов?
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
