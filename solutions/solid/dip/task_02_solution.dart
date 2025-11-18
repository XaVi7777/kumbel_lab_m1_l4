// Решение DIP задачи 2: Отправка уведомлений

abstract class NotificationSender {
  void send(String to, String subject, String body);
}

class EmailSender implements NotificationSender {
  @override
  void send(String to, String subject, String body) {
    print('Email отправлен на $to');
    print('Тема: $subject');
    print('Текст: $body');
  }
}

class SmsSender implements NotificationSender {
  @override
  void send(String to, String subject, String body) {
    print('SMS отправлен на $to: $body');
  }
}

class TelegramSender implements NotificationSender {
  @override
  void send(String to, String subject, String body) {
    print('Telegram отправлен на $to: $body');
  }
}

class NotificationService {
  final NotificationSender _sender;

  NotificationService(this._sender);

  void notifyUser(String recipient, String message) {
    _sender.send(recipient, 'Уведомление', message);
  }

  void notifyAdmins(String message) {
    _sender.send('admin', 'Важно!', message);
  }
}

void main() {
  print('=== Email уведомления ===');
  var emailService = NotificationService(EmailSender());
  emailService.notifyUser('user@example.com', 'Ваш заказ отправлен');

  print('\n=== SMS уведомления ===');
  var smsService = NotificationService(SmsSender());
  smsService.notifyUser('+79001234567', 'Код подтверждения: 1234');

  print('\n=== Telegram уведомления ===');
  var tgService = NotificationService(TelegramSender());
  tgService.notifyAdmins('Сервер перегружен');
}
