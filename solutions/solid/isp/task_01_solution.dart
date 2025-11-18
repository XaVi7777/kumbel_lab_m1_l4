// Решение ISP задачи 1: Worker интерфейсы

abstract class Workable {
  void work();
}

abstract class Eatable {
  void eat();
}

abstract class Sleepable {
  void sleep();
}

class Human implements Workable, Eatable, Sleepable {
  @override
  void work() => print('Человек работает');

  @override
  void eat() => print('Человек ест');

  @override
  void sleep() => print('Человек спит');
}

class Robot implements Workable {
  @override
  void work() => print('Робот работает 24/7');
}

void manageWorkable(Workable worker) {
  worker.work();
}

void manageLiving(Eatable eater, Sleepable sleeper) {
  eater.eat();
  sleeper.sleep();
}

void main() {
  print('=== Человек ===');
  var human = Human();
  manageWorkable(human);
  manageLiving(human, human);

  print('\n=== Робот ===');
  var robot = Robot();
  manageWorkable(robot);
}
