// Решение задачи 1: Первый Stream - поток чисел

void main() {
  print('Запуск стрима...');

  var stream = Stream.periodic(
    Duration(seconds: 1),
    (count) => count + 1,
  ).take(5);

  stream.listen(
    (number) => print('Число: $number'),
    onDone: () => print('Стрим завершен!'),
  );
}
