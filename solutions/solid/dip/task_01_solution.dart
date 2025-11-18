// Решение DIP задачи 1: Dependency Injection для БД

abstract class Database {
  void connect();
  void query(String sql);
  void close();
}

class MySqlDatabase implements Database {
  @override
  void connect() => print('Подключение к MySQL...');

  @override
  void query(String sql) => print('MySQL запрос: $sql');

  @override
  void close() => print('Отключение от MySQL');
}

class PostgresDatabase implements Database {
  @override
  void connect() => print('Подключение к PostgreSQL...');

  @override
  void query(String sql) => print('PostgreSQL запрос: $sql');

  @override
  void close() => print('Отключение от PostgreSQL');
}

class MockDatabase implements Database {
  @override
  void connect() => print('Mock: Подключение...');

  @override
  void query(String sql) => print('Mock запрос: $sql');

  @override
  void close() => print('Mock: Отключение');
}

class UserService {
  final Database _database;

  UserService(this._database);

  void createUser(String name, String email) {
    _database.connect();
    _database.query("INSERT INTO users (name, email) VALUES ('$name', '$email')");
    _database.close();
    print('Пользователь $name создан');
  }

  void getUser(int id) {
    _database.connect();
    _database.query('SELECT * FROM users WHERE id = $id');
    _database.close();
  }
}

void main() {
  print('=== MySQL ===');
  var mysqlService = UserService(MySqlDatabase());
  mysqlService.createUser('Иван', 'ivan@example.com');

  print('\n=== PostgreSQL ===');
  var pgService = UserService(PostgresDatabase());
  pgService.getUser(1);

  print('\n=== Mock (для тестов) ===');
  var mockService = UserService(MockDatabase());
  mockService.createUser('Тест', 'test@test.com');
}
