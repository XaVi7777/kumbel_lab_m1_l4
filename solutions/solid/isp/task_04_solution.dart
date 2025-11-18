// Решение ISP задачи 4: Интерфейсы для хранилища данных

abstract class Readable {
  dynamic read(String key);
}

abstract class Writable {
  void create(String key, dynamic value);
  void update(String key, dynamic value);
  void delete(String key);
}

abstract class Searchable {
  List<String> search(String query);
}

abstract class Transactional {
  void beginTransaction();
  void commit();
  void rollback();
}

class DatabaseStore implements Readable, Writable, Searchable, Transactional {
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

class InMemoryCache implements Readable, Writable {
  final Map<String, dynamic> _cache = {};

  @override
  void create(String key, dynamic value) => _cache[key] = value;

  @override
  dynamic read(String key) => _cache[key];

  @override
  void update(String key, dynamic value) => _cache[key] = value;

  @override
  void delete(String key) => _cache.remove(key);
}

void main() {
  var db = DatabaseStore();
  var cache = InMemoryCache();

  db.beginTransaction();
  db.create('user:1', {'name': 'Иван'});
  db.commit();

  cache.create('temp', 'data');
  print('Cache: ${cache.read('temp')}');
}
