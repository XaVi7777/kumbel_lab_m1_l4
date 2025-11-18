// SOLID - Single Responsibility Principle (Принцип единственной ответственности)
// Задача 4: Класс Employee - кадры, зарплата и отчеты
//
// ПРОБЛЕМА В КОДЕ:
// Класс Employee отвечает за данные сотрудника, расчет зарплаты,
// подсчет отработанных часов и генерацию отчетов. Это 4 причины для изменения!
//
// ЗАДАНИЕ:
// Разделите на классы:
// - Employee - только данные сотрудника
// - SalaryCalculator - расчет зарплаты
// - TimeTracker - учет рабочего времени
// - EmployeeReportGenerator - генерация отчетов

// === КОД С НАРУШЕНИЕМ SRP ===

class Employee {
  String name;
  String position;
  double hourlyRate;
  List<int> hoursWorked = []; // часы по дням

  Employee(this.name, this.position, this.hourlyRate);

  void addWorkDay(int hours) {
    hoursWorked.add(hours);
  }

  // Ответственность: учет времени
  int getTotalHours() {
    return hoursWorked.fold(0, (sum, hours) => sum + hours);
  }

  int getOvertimeHours() {
    int overtime = 0;
    for (var hours in hoursWorked) {
      if (hours > 8) {
        overtime += hours - 8;
      }
    }
    return overtime;
  }

  // Ответственность: расчет зарплаты
  double calculateSalary() {
    int regular = getTotalHours() - getOvertimeHours();
    int overtime = getOvertimeHours();
    return (regular * hourlyRate) + (overtime * hourlyRate * 1.5);
  }

  double calculateTax() {
    return calculateSalary() * 0.13;
  }

  // Ответственность: генерация отчетов
  String generatePayslip() {
    return '''
=== РАСЧЕТНЫЙ ЛИСТ ===
Сотрудник: $name
Должность: $position
Отработано часов: ${getTotalHours()}
Переработка: ${getOvertimeHours()} ч.
Начислено: ${calculateSalary()} руб.
Налог: ${calculateTax()} руб.
К выплате: ${calculateSalary() - calculateTax()} руб.
''';
  }

  String generateTimeReport() {
    return '''
=== ТАБЕЛЬ ===
Сотрудник: $name
Дней отработано: ${hoursWorked.length}
Всего часов: ${getTotalHours()}
Переработка: ${getOvertimeHours()} ч.
''';
  }
}

void main() {
  var emp = Employee('Анна Смирнова', 'Разработчик', 500);
  emp.addWorkDay(8);
  emp.addWorkDay(10);
  emp.addWorkDay(9);
  emp.addWorkDay(8);
  emp.addWorkDay(11);

  print(emp.generateTimeReport());
  print(emp.generatePayslip());
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
