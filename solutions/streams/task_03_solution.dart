// Решение задачи 3: Трансформация Stream - map, where, take

Future<void> main() async {
  print('Четные числа в квадрате (первые 5):');

  var numbers = Stream.fromIterable(List.generate(20, (i) => i + 1));

  await numbers
      .where((n) => n % 2 == 0) // только четные
      .map((n) => n * n) // возводим в квадрат
      .take(5) // первые 5
      .forEach(print);
}
