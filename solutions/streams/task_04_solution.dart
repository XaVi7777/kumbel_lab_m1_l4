// Решение задачи 4: StreamController - управление потоком

import 'dart:async';

void main() {
  var controller = StreamController<String>();

  print('Чат запущен...');

  controller.stream.listen(
    (message) => print('Сообщение: $message'),
    onDone: () => print('Чат закрыт.'),
  );

  // Добавляем сообщения с задержками
  controller.add('Привет!');

  Future.delayed(Duration(seconds: 1), () {
    controller.add('Как дела?');
  });

  Future.delayed(Duration(seconds: 2), () {
    controller.add('Пока!');
    controller.close();
  });
}
