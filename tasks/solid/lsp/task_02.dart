// SOLID - Liskov Substitution Principle (Принцип подстановки Лисков)
// Задача 2: Птица которая не летает
//
// ПРОБЛЕМА В КОДЕ:
// Bird имеет метод fly(), но Penguin не умеет летать.
// Penguin выбрасывает исключение, нарушая контракт Bird.
//
// ЗАДАНИЕ:
// Разделите иерархию: создайте отдельные интерфейсы для разных способностей.
// Bird - базовый класс, FlyingBird - для летающих птиц.

// === КОД С НАРУШЕНИЕМ LSP ===

class Bird {
  String name;

  Bird(this.name);

  void eat() {
    print('$name ест');
  }

  void fly() {
    print('$name летит');
  }
}

class Sparrow extends Bird {
  Sparrow(super.name);

  @override
  void fly() {
    print('$name весело летит, чирикая');
  }
}

class Penguin extends Bird {
  Penguin(super.name);

  @override
  void fly() {
    // Нарушение LSP! Пингвин не может летать
    throw Exception('$name не умеет летать!');
  }

  void swim() {
    print('$name плавает');
  }
}

void makeBirdsFly(List<Bird> birds) {
  for (var bird in birds) {
    bird.fly(); // Ожидаем, что все птицы умеют летать
  }
}

void main() {
  var birds = [
    Sparrow('Воробей'),
    Penguin('Пингвин'), // Это вызовет исключение!
  ];

  try {
    makeBirdsFly(birds);
  } catch (e) {
    print('Ошибка: $e');
  }
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
