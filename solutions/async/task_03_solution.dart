// Решение задачи 3: Обработка ошибок в асинхронном коде

Future<String> fetchUserById(int id) async {
  if (id <= 0) {
    throw Exception('Неверный ID пользователя');
  }

  await Future.delayed(Duration(seconds: 1));
  return 'User_$id';
}

Future<void> main() async {
  // Успешный запрос
  print('Запрос пользователя с ID: 5');
  try {
    var user = await fetchUserById(5);
    print('Получен: $user');
  } catch (e) {
    print('Ошибка: $e');
  }

  print('---');

  // Запрос с ошибкой
  print('Запрос пользователя с ID: -1');
  try {
    var user = await fetchUserById(-1);
    print('Получен: $user');
  } catch (e) {
    print('Ошибка: $e');
  }
}
