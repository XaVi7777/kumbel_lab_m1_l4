// Решение задачи 1: Первый миксин - добавляем функциональность

mixin Swimmer {
  void swim() {
    print('Плыву!');
  }
}

mixin Flyer {
  void fly() {
    print('Лечу!');
  }
}

class Duck with Swimmer, Flyer {
  void quack() {
    print('Кря-кря!');
  }
}

void main() {
  var duck = Duck();
  print('Утка умеет:');
  duck.swim();
  duck.fly();
  duck.quack();
}
