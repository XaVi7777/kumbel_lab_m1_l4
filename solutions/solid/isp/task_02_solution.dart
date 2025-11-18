// Решение ISP задачи 2: Многофункциональное устройство

abstract class Printer {
  void printDocument(String document);
}

abstract class Scanner {
  void scan(String document);
}

abstract class Fax {
  void fax(String document);
}

class MultiFunctionDevice implements Printer, Scanner, Fax {
  @override
  void printDocument(String document) {
    print('Печать: $document');
  }

  @override
  void scan(String document) {
    print('Сканирование: $document');
  }

  @override
  void fax(String document) {
    print('Отправка факса: $document');
  }
}

class SimplePrinter implements Printer {
  @override
  void printDocument(String document) {
    print('Печать: $document');
  }
}

class OldFaxMachine implements Fax {
  @override
  void fax(String document) {
    print('Факс отправлен: $document');
  }
}

void main() {
  print('=== МФУ ===');
  var mfd = MultiFunctionDevice();
  mfd.printDocument('Отчет.pdf');
  mfd.scan('Документ');
  mfd.fax('Контракт');

  print('\n=== Простой принтер ===');
  var printer = SimplePrinter();
  printer.printDocument('Письмо');

  print('\n=== Факс ===');
  var fax = OldFaxMachine();
  fax.fax('Заявка');
}
