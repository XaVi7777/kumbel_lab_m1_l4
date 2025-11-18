// SOLID - Dependency Inversion Principle (Принцип инверсии зависимостей)
// Задача 1: Жесткая зависимость от конкретной БД
//
// ПРИНЦИП:
// Модули верхнего уровня не должны зависеть от модулей нижнего уровня.
// Оба должны зависеть от абстракций. Абстракции не должны зависеть от деталей.
//
// ПРОБЛЕМА В КОДЕ:
// UserService напрямую создает MySqlDatabase внутри конструктора.
// Невозможно заменить базу данных на PostgreSQL или использовать мок для тестов.
//
// ЗАДАНИЕ:
// Создайте абстрактный класс Database.
// UserService должен принимать Database через конструктор (Dependency Injection).

// === КОД С НАРУШЕНИЕМ DIP ===

class MySqlDatabase {
  void connect() {
    print('Подключение к MySQL...');
  }

  void query(String sql) {
    print('MySQL запрос: $sql');
  }

  void close() {
    print('Отключение от MySQL');
  }
}

class UserService {
  // Жесткая зависимость от конкретной реализации!
  final MySqlDatabase _database = MySqlDatabase();

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
  var service = UserService();
  service.createUser('Иван', 'ivan@example.com');
  service.getUser(1);

  // Как использовать PostgreSQL? Как тестировать без реальной БД?
  // Это невозможно без изменения UserService!
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
