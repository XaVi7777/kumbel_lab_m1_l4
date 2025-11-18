// Решение задачи 3: Наследование классов

class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void makeSound() {
    print('Какой-то звук');
  }
}

class Dog extends Animal {
  String breed;

  Dog(super.name, super.age, this.breed);

  @override
  void makeSound() {
    print('Гав-гав!');
  }

  void fetch() {
    print('$name принес палку!');
  }
}

void main() {
  var animal = Animal('Мурзик', 3);
  print('Животное: ${animal.name}, возраст: ${animal.age}');
  animal.makeSound();

  print('---');

  var dog = Dog('Бобик', 5, 'Лабрадор');
  print('Собака: ${dog.name}, возраст: ${dog.age}, порода: ${dog.breed}');
  dog.makeSound();
  dog.fetch();
}
