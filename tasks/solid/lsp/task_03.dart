// SOLID - Liskov Substitution Principle (Принцип подстановки Лисков)
// Задача 3: Только для чтения
//
// ПРОБЛЕМА В КОДЕ:
// ReadOnlyFile наследует File, но метод write() выбрасывает исключение.
// Код, работающий с File, не ожидает такого поведения.
//
// ЗАДАНИЕ:
// Создайте базовый класс для чтения (ReadableFile) и
// расширьте его для записи (WritableFile).

// === КОД С НАРУШЕНИЕМ LSP ===

class File {
  String name;
  String content = '';

  File(this.name);

  String read() {
    return content;
  }

  void write(String data) {
    content = data;
    print('Записано в $name: $data');
  }
}

class ReadOnlyFile extends File {
  ReadOnlyFile(super.name);

  @override
  void write(String data) {
    // Нарушение LSP! Файл должен поддерживать запись
    throw Exception('Файл $name только для чтения!');
  }
}

void saveData(File file, String data) {
  file.write(data); // Ожидаем, что запись работает
  print('Данные сохранены');
}

void main() {
  var normalFile = File('document.txt');
  var readOnlyFile = ReadOnlyFile('config.txt');

  print('=== Обычный файл ===');
  saveData(normalFile, 'Hello, World!');

  print('\n=== Только для чтения ===');
  try {
    saveData(readOnlyFile, 'New data'); // Ошибка!
  } catch (e) {
    print('Ошибка: $e');
  }
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
