// Решение задачи 2: async/await - удобный синтаксис

Future<int> fetchData() async {
  print('Начинаю загрузку данных...');
  await Future.delayed(Duration(seconds: 1));
  print('Данные получены!');
  return 42;
}

Future<void> main() async {
  var result = await fetchData();
  print('Результат: $result');
}
