// Решение SRP задачи 2: Разделение Report и форматтеров

class Report {
  String title;
  String content;
  DateTime date;

  Report(this.title, this.content, this.date);
}

abstract class ReportFormatter {
  String format(Report report);
}

class HtmlFormatter implements ReportFormatter {
  @override
  String format(Report report) {
    return '''
<html>
  <head><title>${report.title}</title></head>
  <body>
    <h1>${report.title}</h1>
    <p>Дата: ${report.date}</p>
    <p>${report.content}</p>
  </body>
</html>''';
  }
}

class JsonFormatter implements ReportFormatter {
  @override
  String format(Report report) {
    return '''
{
  "title": "${report.title}",
  "content": "${report.content}",
  "date": "${report.date}"
}''';
  }
}

class PlainTextFormatter implements ReportFormatter {
  @override
  String format(Report report) {
    return '${report.title}\nДата: ${report.date}\n\n${report.content}';
  }
}

void main() {
  var report = Report(
    'Месячный отчет',
    'Продажи выросли на 15%',
    DateTime.now(),
  );

  print('=== HTML ===');
  print(HtmlFormatter().format(report));

  print('\n=== JSON ===');
  print(JsonFormatter().format(report));

  print('\n=== Plain Text ===');
  print(PlainTextFormatter().format(report));
}
