// SOLID - Interface Segregation Principle (Принцип разделения интерфейсов)
// Задача 3: Интерфейс для всех типов отчетов
//
// ПРОБЛЕМА В КОДЕ:
// ReportGenerator требует реализации экспорта во все форматы.
// SalesReport не нуждается в PDF, TechReport не нуждается в Excel.
//
// ЗАДАНИЕ:
// Создайте отдельные интерфейсы для каждого формата экспорта.
// Каждый отчет реализует только нужные форматы.

// === КОД С НАРУШЕНИЕМ ISP ===

abstract class ReportGenerator {
  String generateReport();
  String exportToPdf();
  String exportToExcel();
  String exportToHtml();
  String exportToJson();
}

class SalesReport implements ReportGenerator {
  @override
  String generateReport() {
    return 'Отчет о продажах: выручка 1,000,000 руб.';
  }

  @override
  String exportToPdf() {
    throw UnimplementedError('PDF не поддерживается для этого отчета');
  }

  @override
  String exportToExcel() {
    return 'Экспорт в Excel: sales_report.xlsx';
  }

  @override
  String exportToHtml() {
    return '<h1>Отчет о продажах</h1>';
  }

  @override
  String exportToJson() {
    return '{"type": "sales", "revenue": 1000000}';
  }
}

class TechReport implements ReportGenerator {
  @override
  String generateReport() {
    return 'Технический отчет: 99.9% uptime';
  }

  @override
  String exportToPdf() {
    return 'Экспорт в PDF: tech_report.pdf';
  }

  @override
  String exportToExcel() {
    throw UnimplementedError('Excel не поддерживается для этого отчета');
  }

  @override
  String exportToHtml() {
    return '<h1>Технический отчет</h1>';
  }

  @override
  String exportToJson() {
    return '{"type": "tech", "uptime": 99.9}';
  }
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

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
