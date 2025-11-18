// Решение задачи 1: Первый Future - имитация загрузки

Future<String> fetchUserName() {
  return Future.delayed(Duration(seconds: 2), () => 'Иван Петров');
}

void main() {
  print('Загрузка...');

  fetchUserName().then((name) {
    print('Пользователь: $name');
  });
}
