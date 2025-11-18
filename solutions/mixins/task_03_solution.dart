// Решение задачи 3: Миксин on - ограничение применения

class Musician {
  String name;

  Musician(this.name);

  void play() {
    print('$name играет на сцене');
  }
}

mixin Vocalist on Musician {
  void sing() {
    print('$name поёт: "We are the champions!"');
  }
}

mixin Guitarist on Musician {
  void playGuitar() {
    print('$name играет на гитаре: соло!');
  }
}

class RockStar extends Musician with Vocalist, Guitarist {
  RockStar(super.name);
}

void main() {
  var star = RockStar('Freddie');

  star.play();
  star.sing();
  star.playGuitar();
}
