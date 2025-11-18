// Решение LSP задачи 1: Квадрат и прямоугольник

abstract class Shape {
  double getArea();
}

class Rectangle implements Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double getArea() => width * height;
}

class Square implements Shape {
  final double side;

  Square(this.side);

  @override
  double getArea() => side * side;
}

void main() {
  var rect = Rectangle(5, 10);
  var square = Square(4);

  print('Прямоугольник 5x10: площадь = ${rect.getArea()}');
  print('Квадрат 4x4: площадь = ${square.getArea()}');
}
