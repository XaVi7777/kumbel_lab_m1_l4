// Решение OCP задачи 2: Система уведомлений

abstract class NotificationChannel {
  void send(String message, String recipient);
}

class EmailChannel implements NotificationChannel {
  @override
  void send(String message, String recipient) {
    print('Отправка Email на $recipient: $message');
  }
}

class SmsChannel implements NotificationChannel {
  @override
  void send(String message, String recipient) {
    print('Отправка SMS на $recipient: $message');
  }
}

class PushChannel implements NotificationChannel {
  @override
  void send(String message, String recipient) {
    print('Отправка Push на $recipient: $message');
  }
}

class TelegramChannel implements NotificationChannel {
  @override
  void send(String message, String recipient) {
    print('Отправка Telegram на $recipient: $message');
  }
}

class NotificationService {
  void send(NotificationChannel channel, String message, String recipient) {
    channel.send(message, recipient);
  }
}

void main() {
  var service = NotificationService();

  service.send(EmailChannel(), 'Добро пожаловать!', 'user@example.com');
  service.send(SmsChannel(), 'Ваш код: 1234', '+79001234567');
  service.send(PushChannel(), 'Новое сообщение', 'device_token_123');
  service.send(TelegramChannel(), 'Привет из Telegram!', '@username');
}
