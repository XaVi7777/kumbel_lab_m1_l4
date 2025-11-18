// SOLID - Interface Segregation Principle (Принцип разделения интерфейсов)
// Задача 4: Интерфейс для хранилища данных
//
// ПРОБЛЕМА В КОДЕ:
// DataStore требует CRUD + поиск + транзакции.
// InMemoryCache не поддерживает транзакции, ReadOnlyStore не поддерживает запись.
//
// ЗАДАНИЕ:
// Разделите на: Readable, Writable, Searchable, Transactional.
// Каждое хранилище реализует только нужные возможности.

// === КОД С НАРУШЕНИЕМ ISP ===

abstract class DataStore {
  // CRUD
  void create(String key, dynamic value);
  dynamic read(String key);
  void update(String key, dynamic value);
  void delete(String key);

  // Поиск
  List<String> search(String query);

  // Транзакции
  void beginTransaction();
  void commit();
  void rollback();
}

class DatabaseStore implements DataStore {
  final Map<String, dynamic> _data = {};

  @override
  void create(String key, dynamic value) {
    _data[key] = value;
    print('DB: Создано $key');
  }

  @override
  dynamic read(String key) => _data[key];

  @override
  void update(String key, dynamic value) {
    _data[key] = value;
    print('DB: Обновлено $key');
  }

  @override
  void delete(String key) {
    _data.remove(key);
    print('DB: Удалено $key');
  }

  @override
  List<String> search(String query) {
    return _data.keys.where((k) => k.contains(query)).toList();
  }

  @override
  void beginTransaction() => print('DB: Начало транзакции');

  @override
  void commit() => print('DB: Коммит');

  @override
  void rollback() => print('DB: Откат');
}

class InMemoryCache implements DataStore {
  final Map<String, dynamic> _cache = {};

  @override
  void create(String key, dynamic value) => _cache[key] = value;

  @override
  dynamic read(String key) => _cache[key];

  @override
  void update(String key, dynamic value) => _cache[key] = value;

  @override
  void delete(String key) => _cache.remove(key);

  @override
  List<String> search(String query) {
    throw UnimplementedError('Кэш не поддерживает поиск');
  }

  @override
  void beginTransaction() {
    throw UnimplementedError('Кэш не поддерживает транзакции');
  }

  @override
  void commit() {
    throw UnimplementedError('Кэш не поддерживает транзакции');
  }

  @override
  void rollback() {
    throw UnimplementedError('Кэш не поддерживает транзакции');
  }
}

void main() {
  var db = DatabaseStore();
  var cache = InMemoryCache();

  db.beginTransaction();
  db.create('user:1', {'name': 'Иван'});
  db.commit();

  cache.create('temp', 'data');
  print('Cache: ${cache.read('temp')}');

  try {
    cache.beginTransaction(); // Ошибка!
  } catch (e) {
    print('Ошибка: $e');
  }
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
