// Решение задачи 4: Абстрактные классы и интерфейсы

abstract class Shape {
  double getArea();
  double getPerimeter();
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double getArea() => width * height;

  @override
  double getPerimeter() => 2 * (width + height);
}

class Circle extends Shape {
  double radius;
  static const double pi = 3.14159;

  Circle(this.radius);

  @override
  double getArea() => pi * radius * radius;

  @override
  double getPerimeter() => 2 * pi * radius;
}

void main() {
  var rect = Rectangle(5, 3);
  print('Прямоугольник: ширина=${rect.width}, высота=${rect.height}');
  print('Площадь: ${rect.getArea()}, Периметр: ${rect.getPerimeter()}');

  print('---');

  var circle = Circle(4);
  print('Круг: радиус=${circle.radius}');
  print('Площадь: ${circle.getArea()}, Периметр: ${circle.getPerimeter()}');
}
