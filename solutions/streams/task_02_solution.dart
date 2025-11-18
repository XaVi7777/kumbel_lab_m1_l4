// Решение задачи 2: async* и yield - создание Stream

Stream<int> countDown(int from) async* {
  for (int i = from; i >= 1; i--) {
    yield i;
    await Future.delayed(Duration(milliseconds: 500));
  }
}

Future<void> main() async {
  print('Обратный отсчет:');

  await for (var number in countDown(5)) {
    print(number);
  }

  print('Старт!');
}
