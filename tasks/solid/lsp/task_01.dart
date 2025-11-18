// SOLID - Liskov Substitution Principle (Принцип подстановки Лисков)
// Задача 1: Квадрат - это НЕ прямоугольник
//
// ПРИНЦИП:
// Объекты дочернего класса должны полностью заменять объекты родительского класса
// без изменения корректности программы. Наследник не должен нарушать контракт предка.
//
// ПРОБЛЕМА В КОДЕ:
// Square наследует Rectangle, но переопределяет сеттеры так, что нарушает
// ожидаемое поведение: setWidth меняет и height. Это ломает код, работающий с Rectangle.
//
// ЗАДАНИЕ:
// Создайте общий абстрактный класс Shape с методом getArea().
// Rectangle и Square должны быть отдельными реализациями Shape.

// === КОД С НАРУШЕНИЕМ LSP ===

class Rectangle {
  double _width;
  double _height;

  Rectangle(this._width, this._height);

  double get width => _width;
  double get height => _height;

  set width(double value) {
    _width = value;
  }

  set height(double value) {
    _height = value;
  }

  double getArea() => _width * _height;
}

class Square extends Rectangle {
  Square(double side) : super(side, side);

  // Нарушение LSP! При изменении width меняется и height
  @override
  set width(double value) {
    _width = value;
    _height = value; // Неожиданное поведение!
  }

  @override
  set height(double value) {
    _width = value; // Неожиданное поведение!
    _height = value;
  }
}

// Функция ожидает корректное поведение Rectangle
void processRectangle(Rectangle rect) {
  rect.width = 5;
  rect.height = 10;

  // Ожидаем площадь 5 * 10 = 50
  double expectedArea = 50;
  double actualArea = rect.getArea();

  print('Ожидаемая площадь: $expectedArea');
  print('Реальная площадь: $actualArea');
  print('Результат: ${expectedArea == actualArea ? "OK" : "ОШИБКА!"}');
}

void main() {
  print('=== Rectangle ===');
  processRectangle(Rectangle(2, 3));

  print('\n=== Square (нарушение LSP) ===');
  processRectangle(Square(4)); // Площадь будет 100, а не 50!
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
