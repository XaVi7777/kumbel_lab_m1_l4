// Решение LSP задачи 3: Файлы только для чтения

abstract class ReadableFile {
  String name;
  String content = '';

  ReadableFile(this.name);

  String read() => content;
}

class WritableFile extends ReadableFile {
  WritableFile(super.name);

  void write(String data) {
    content = data;
    print('Записано в $name: $data');
  }
}

class ReadOnlyFile extends ReadableFile {
  ReadOnlyFile(super.name, String initialContent) {
    content = initialContent;
  }
}

void saveData(WritableFile file, String data) {
  file.write(data);
  print('Данные сохранены');
}

void readData(ReadableFile file) {
  print('Чтение из ${file.name}: ${file.read()}');
}

void main() {
  var writableFile = WritableFile('document.txt');
  var readOnlyFile = ReadOnlyFile('config.txt', 'readonly content');

  print('=== Файл для записи ===');
  saveData(writableFile, 'Hello, World!');
  readData(writableFile);

  print('\n=== Только для чтения ===');
  readData(readOnlyFile);
}
