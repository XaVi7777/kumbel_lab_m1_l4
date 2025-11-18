// Решение задачи 2: Миксин с полями

mixin Counter {
  int _count = 0;

  void increment() => _count++;
  void decrement() => _count--;
  int getCount() => _count;
}

class ClickButton with Counter {
  void click() {
    increment();
    print('Клик! Всего кликов: ${getCount()}');
  }
}

void main() {
  var button = ClickButton();

  button.click();
  button.click();
  button.click();

  print('Итого кликов: ${button.getCount()}');
}
