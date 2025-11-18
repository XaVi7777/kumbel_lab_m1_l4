// Решение задачи 4: Параллельное выполнение с Future.wait

Future<List<String>> fetchUsers() async {
  await Future.delayed(Duration(seconds: 2));
  return ['Иван', 'Мария', 'Петр'];
}

Future<List<String>> fetchProducts() async {
  await Future.delayed(Duration(seconds: 3));
  return ['Телефон', 'Ноутбук'];
}

Future<List<int>> fetchOrders() async {
  await Future.delayed(Duration(seconds: 1));
  return [101, 102, 103];
}

Future<void> main() async {
  print('Начинаю загрузку данных...');

  var stopwatch = Stopwatch()..start();

  var results = await Future.wait([
    fetchUsers(),
    fetchProducts(),
    fetchOrders(),
  ]);

  stopwatch.stop();

  print('Пользователи: ${results[0]}');
  print('Продукты: ${results[1]}');
  print('Заказы: ${results[2]}');
  print('Общее время: ~${stopwatch.elapsed.inSeconds} секунды');
}
