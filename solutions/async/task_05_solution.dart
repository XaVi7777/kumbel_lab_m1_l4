// Решение задачи 5: Система загрузки с повторными попытками

int _attemptCount = 0;

Future<String> unreliableRequest() async {
  _attemptCount++;

  if (_attemptCount < 3) {
    throw Exception('Сервер недоступен');
  }

  return 'Данные успешно получены!';
}

Future<String> fetchWithRetry(int maxRetries) async {
  for (int attempt = 1; attempt <= maxRetries; attempt++) {
    print('Попытка $attempt...');

    try {
      var result = await unreliableRequest();
      print('Успех: $result');
      return result;
    } catch (e) {
      if (attempt < maxRetries) {
        print('Ошибка: $e. Повтор через $attempt сек...');
        await Future.delayed(Duration(seconds: attempt));
      } else {
        print('Все попытки исчерпаны');
        rethrow;
      }
    }
  }

  throw Exception('Не удалось выполнить запрос');
}

Future<void> main() async {
  try {
    await fetchWithRetry(5);
  } catch (e) {
    print('Финальная ошибка: $e');
  }
}
