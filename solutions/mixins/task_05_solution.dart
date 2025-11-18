// Решение задачи 5: Система навыков для игровых персонажей

abstract class GameCharacter {
  String name;
  int health = 100;
  int mana = 50;

  GameCharacter(this.name);

  void showStats() {
    print('Здоровье: $health, Мана: $mana');
  }
}

mixin MeleeAttack on GameCharacter {
  void meleeAttack(String target) {
    print('$name наносит удар мечом по $target! Урон: 25');
  }
}

mixin RangedAttack on GameCharacter {
  void rangedAttack(String target) {
    print('$name стреляет в $target! Урон: 20');
  }
}

mixin Healer on GameCharacter {
  void heal() {
    if (mana >= 20) {
      mana -= 20;
      health += 30;
      print('$name лечится! +30 здоровья, -20 маны');
    } else {
      print('$name: недостаточно маны для лечения!');
    }
  }
}

class Warrior extends GameCharacter with MeleeAttack {
  Warrior(super.name);
}

class Archer extends GameCharacter with RangedAttack {
  Archer(super.name);
}

class Paladin extends GameCharacter with MeleeAttack, Healer {
  Paladin(super.name);
}

void main() {
  print('=== Воин Конан ===');
  var warrior = Warrior('Конан');
  warrior.showStats();
  warrior.meleeAttack('Гоблин');

  print('---');

  print('=== Лучник Леголас ===');
  var archer = Archer('Леголас');
  archer.showStats();
  archer.rangedAttack('Орк');

  print('---');

  print('=== Паладин Артас ===');
  var paladin = Paladin('Артас');
  paladin.showStats();
  paladin.meleeAttack('Нежить');
  paladin.heal();
  paladin.showStats();
}
