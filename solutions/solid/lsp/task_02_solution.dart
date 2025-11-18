// Решение LSP задачи 2: Птицы

abstract class Bird {
  String name;
  Bird(this.name);

  void eat() {
    print('$name ест');
  }
}

abstract class FlyingBird extends Bird {
  FlyingBird(super.name);

  void fly() {
    print('$name летит');
  }
}

class Sparrow extends FlyingBird {
  Sparrow(super.name);

  @override
  void fly() {
    print('$name весело летит, чирикая');
  }
}

class Penguin extends Bird {
  Penguin(super.name);

  void swim() {
    print('$name плавает');
  }
}

void makeFlyingBirdsFly(List<FlyingBird> birds) {
  for (var bird in birds) {
    bird.fly();
  }
}

void main() {
  var flyingBirds = [
    Sparrow('Воробей'),
  ];

  var penguin = Penguin('Пингвин');

  makeFlyingBirdsFly(flyingBirds);
  penguin.eat();
  penguin.swim();
}
