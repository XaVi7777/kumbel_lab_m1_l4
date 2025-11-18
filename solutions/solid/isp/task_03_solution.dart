// Решение ISP задачи 3: Интерфейсы для экспорта отчетов

abstract class ReportGenerator {
  String generateReport();
}

abstract class ExcelExportable {
  String exportToExcel();
}

abstract class PdfExportable {
  String exportToPdf();
}

abstract class HtmlExportable {
  String exportToHtml();
}

abstract class JsonExportable {
  String exportToJson();
}

class SalesReport implements ReportGenerator, ExcelExportable, HtmlExportable, JsonExportable {
  @override
  String generateReport() => 'Отчет о продажах: выручка 1,000,000 руб.';

  @override
  String exportToExcel() => 'Экспорт в Excel: sales_report.xlsx';

  @override
  String exportToHtml() => '<h1>Отчет о продажах</h1>';

  @override
  String exportToJson() => '{"type": "sales", "revenue": 1000000}';
}

class TechReport implements ReportGenerator, PdfExportable, HtmlExportable, JsonExportable {
  @override
  String generateReport() => 'Технический отчет: 99.9% uptime';

  @override
  String exportToPdf() => 'Экспорт в PDF: tech_report.pdf';

  @override
  String exportToHtml() => '<h1>Технический отчет</h1>';

  @override
  String exportToJson() => '{"type": "tech", "uptime": 99.9}';
}

void main() {
  var sales = SalesReport();
  var tech = TechReport();

  print('=== Sales Report ===');
  print(sales.generateReport());
  print(sales.exportToExcel());

  print('\n=== Tech Report ===');
  print(tech.generateReport());
  print(tech.exportToPdf());
}
