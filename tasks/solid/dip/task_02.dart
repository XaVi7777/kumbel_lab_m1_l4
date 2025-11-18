// SOLID - Dependency Inversion Principle (Принцип инверсии зависимостей)
// Задача 2: Отправка уведомлений
//
// ПРОБЛЕМА В КОДЕ:
// NotificationService напрямую зависит от EmailSender.
// Нельзя добавить SMS или Push уведомления без изменения класса.
//
// ЗАДАНИЕ:
// Создайте интерфейс NotificationSender.
// NotificationService должен работать с абстракцией, а не конкретной реализацией.

// === КОД С НАРУШЕНИЕМ DIP ===

class EmailSender {
  void send(String to, String subject, String body) {
    print('Email отправлен на $to');
    print('Тема: $subject');
    print('Текст: $body');
  }
}

class NotificationService {
  // Жесткая зависимость от EmailSender
  final EmailSender _emailSender = EmailSender();

  void notifyUser(String email, String message) {
    _emailSender.send(email, 'Уведомление', message);
  }

  void notifyAdmins(String message) {
    _emailSender.send('admin@example.com', 'Важно!', message);
  }
}

void main() {
  var service = NotificationService();

  service.notifyUser('user@example.com', 'Ваш заказ отправлен');
  print('---');
  service.notifyAdmins('Сервер перегружен');

  // Как отправить SMS? Push? Telegram?
  // Нужно менять NotificationService!
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
