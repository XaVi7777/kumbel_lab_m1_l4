// SOLID - Interface Segregation Principle (Принцип разделения интерфейсов)
// Задача 1: Слишком "толстый" интерфейс Worker
//
// ПРИНЦИП:
// Клиенты не должны зависеть от интерфейсов, которые они не используют.
// Лучше много маленьких специализированных интерфейсов, чем один большой.
//
// ПРОБЛЕМА В КОДЕ:
// Интерфейс Worker содержит методы для всех типов работников.
// Robot вынужден реализовывать eat() и sleep(), хотя он этого не делает.
//
// ЗАДАНИЕ:
// Разделите Worker на маленькие интерфейсы:
// - Workable (work)
// - Eatable (eat)
// - Sleepable (sleep)
// Каждый класс реализует только нужные интерфейсы.

// === КОД С НАРУШЕНИЕМ ISP ===

abstract class Worker {
  void work();
  void eat();
  void sleep();
}

class Human implements Worker {
  @override
  void work() {
    print('Человек работает');
  }

  @override
  void eat() {
    print('Человек ест');
  }

  @override
  void sleep() {
    print('Человек спит');
  }
}

class Robot implements Worker {
  @override
  void work() {
    print('Робот работает 24/7');
  }

  @override
  void eat() {
    // Нарушение ISP! Робот не ест
    throw UnimplementedError('Робот не ест');
  }

  @override
  void sleep() {
    // Нарушение ISP! Робот не спит
    throw UnimplementedError('Робот не спит');
  }
}

void manageWorker(Worker worker) {
  worker.work();
  worker.eat();
  worker.sleep();
}

void main() {
  print('=== Человек ===');
  manageWorker(Human());

  print('\n=== Робот ===');
  try {
    manageWorker(Robot()); // Ошибка!
  } catch (e) {
    print('Ошибка: $e');
  }
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
