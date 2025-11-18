// Решение SRP задачи 4: Разделение Employee на несколько классов

class Employee {
  String name;
  String position;
  double hourlyRate;

  Employee(this.name, this.position, this.hourlyRate);
}

class TimeTracker {
  final List<int> hoursWorked = [];

  void addWorkDay(int hours) {
    hoursWorked.add(hours);
  }

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
}

class SalaryCalculator {
  double calculateSalary(Employee emp, TimeTracker tracker) {
    int regular = tracker.getTotalHours() - tracker.getOvertimeHours();
    int overtime = tracker.getOvertimeHours();
    return (regular * emp.hourlyRate) + (overtime * emp.hourlyRate * 1.5);
  }

  double calculateTax(double salary) {
    return salary * 0.13;
  }
}

class EmployeeReportGenerator {
  String generateTimeReport(Employee emp, TimeTracker tracker) {
    return '''
=== ТАБЕЛЬ ===
Сотрудник: ${emp.name}
Дней отработано: ${tracker.hoursWorked.length}
Всего часов: ${tracker.getTotalHours()}
Переработка: ${tracker.getOvertimeHours()} ч.
''';
  }

  String generatePayslip(Employee emp, TimeTracker tracker, SalaryCalculator calc) {
    var salary = calc.calculateSalary(emp, tracker);
    var tax = calc.calculateTax(salary);
    return '''
=== РАСЧЕТНЫЙ ЛИСТ ===
Сотрудник: ${emp.name}
Должность: ${emp.position}
Отработано часов: ${tracker.getTotalHours()}
Переработка: ${tracker.getOvertimeHours()} ч.
Начислено: $salary руб.
Налог: $tax руб.
К выплате: ${salary - tax} руб.
''';
  }
}

void main() {
  var emp = Employee('Анна Смирнова', 'Разработчик', 500);
  var tracker = TimeTracker();
  var salaryCalc = SalaryCalculator();
  var reportGen = EmployeeReportGenerator();

  tracker.addWorkDay(8);
  tracker.addWorkDay(10);
  tracker.addWorkDay(9);
  tracker.addWorkDay(8);
  tracker.addWorkDay(11);

  print(reportGen.generateTimeReport(emp, tracker));
  print(reportGen.generatePayslip(emp, tracker, salaryCalc));
}
