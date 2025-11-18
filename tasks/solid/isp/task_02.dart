// SOLID - Interface Segregation Principle (Принцип разделения интерфейсов)
// Задача 2: Многофункциональное устройство
//
// ПРОБЛЕМА В КОДЕ:
// Интерфейс Machine объединяет все возможные функции устройства.
// SimplePrinter вынужден реализовывать scan() и fax(), хотя не поддерживает их.
//
// ЗАДАНИЕ:
// Разделите на интерфейсы: Printer, Scanner, Fax.
// MultiFunctionDevice реализует все, SimplePrinter - только Printer.

// === КОД С НАРУШЕНИЕМ ISP ===

abstract class Machine {
  void print(String document);
  void scan(String document);
  void fax(String document);
}

class MultiFunctionDevice implements Machine {
  @override
  void print(String document) {
    print('Печать: $document'); // print shadowing fix below
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

class SimplePrinter implements Machine {
  @override
  void print(String document) {
    print('Печать: $document');
  }

  @override
  void scan(String document) {
    // Нарушение ISP! Простой принтер не сканирует
    throw UnimplementedError('Этот принтер не поддерживает сканирование');
  }

  @override
  void fax(String document) {
    // Нарушение ISP! Простой принтер не отправляет факсы
    throw UnimplementedError('Этот принтер не поддерживает факс');
  }
}

class OldFaxMachine implements Machine {
  @override
  void print(String document) {
    throw UnimplementedError('Факс не печатает');
  }

  @override
  void scan(String document) {
    throw UnimplementedError('Факс не сканирует');
  }

  @override
  void fax(String document) {
    print('Факс отправлен: $document');
  }
}

void main() {
  // var mfd = MultiFunctionDevice();
  // var simple = SimplePrinter();

  print('Этот код демонстрирует проблему ISP.');
  print('Разделите интерфейс Machine на меньшие интерфейсы.');
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
