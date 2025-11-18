// SOLID - Single Responsibility Principle (Принцип единственной ответственности)
// Задача 2: Класс Report генерирует и форматирует
//
// ПРОБЛЕМА В КОДЕ:
// Класс Report отвечает и за хранение данных отчета, и за форматирование
// в разные форматы (HTML, JSON). При добавлении нового формата нужно менять класс.
//
// ЗАДАНИЕ:
// Разделите на классы:
// - Report - только данные отчета
// - ReportFormatter (абстрактный) с реализациями HtmlFormatter, JsonFormatter

// === КОД С НАРУШЕНИЕМ SRP ===

class Report {
  String title;
  String content;
  DateTime date;

  Report(this.title, this.content, this.date);

  String toHtml() {
    return '''
<html>
  <head><title>$title</title></head>
  <body>
    <h1>$title</h1>
    <p>Дата: $date</p>
    <p>$content</p>
  </body>
</html>''';
  }

  String toJson() {
    return '''
{
  "title": "$title",
  "content": "$content",
  "date": "$date"
}''';
  }

  String toPlainText() {
    return '$title\nДата: $date\n\n$content';
  }
}

void main() {
  var report = Report(
    'Месячный отчет',
    'Продажи выросли на 15%',
    DateTime.now(),
  );

  print('=== HTML ===');
  print(report.toHtml());
  print('\n=== JSON ===');
  print(report.toJson());
  print('\n=== Plain Text ===');
  print(report.toPlainText());
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
