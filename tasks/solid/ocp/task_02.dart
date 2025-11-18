// SOLID - Open/Closed Principle (Принцип открытости/закрытости)
// Задача 2: Система уведомлений
//
// ПРОБЛЕМА В КОДЕ:
// Метод send() содержит switch для разных типов уведомлений.
// Добавление нового канала (Telegram, Push) требует изменения класса.
//
// ЗАДАНИЕ:
// Создайте абстрактный класс NotificationChannel.
// Реализуйте EmailChannel, SmsChannel и добавьте TelegramChannel.
// NotificationService должен работать с любым каналом без изменений.

// === КОД С НАРУШЕНИЕМ OCP ===

class NotificationService {
  void send(String channel, String message, String recipient) {
    switch (channel) {
      case 'email':
        print('Отправка Email на $recipient: $message');
        // Логика отправки email
        break;
      case 'sms':
        print('Отправка SMS на $recipient: $message');
        // Логика отправки SMS
        break;
      case 'push':
        print('Отправка Push на $recipient: $message');
        // Логика отправки Push
        break;
      // Новый канал? Нужно менять этот код!
    }
  }
}

void main() {
  var service = NotificationService();

  service.send('email', 'Добро пожаловать!', 'user@example.com');
  service.send('sms', 'Ваш код: 1234', '+79001234567');
  service.send('push', 'Новое сообщение', 'device_token_123');
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
