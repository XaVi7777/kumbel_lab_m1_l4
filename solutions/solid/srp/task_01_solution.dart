// Решение SRP задачи 1: Разделение класса User

// Класс только для данных пользователя
class User {
  String name;
  String email;

  User(this.name, this.email);

  String getInfo() {
    return 'Пользователь: $name, Email: $email';
  }
}

// Класс для работы с БД
class UserRepository {
  void save(User user) {
    print('Сохранение пользователя ${user.name} в базу данных...');
  }
}

// Класс для отправки email
class EmailService {
  void sendWelcomeEmail(User user) {
    print('Отправка приветственного email на ${user.email}...');
  }
}

void main() {
  var user = User('Иван', 'ivan@example.com');
  var repository = UserRepository();
  var emailService = EmailService();

  print(user.getInfo());
  repository.save(user);
  emailService.sendWelcomeEmail(user);
}
