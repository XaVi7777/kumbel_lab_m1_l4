# Учебные задачи по Dart - Модуль 1, Урок 4

Добро пожаловать в коллекцию учебных задач для начинающих разработчиков на Dart!

## О проекте

Этот проект содержит **45 практических задач** по 9 ключевым темам Dart. Проект разделен на две части: базовые концепции ООП и принципы SOLID.

### Часть 1: Базовые концепции (20 задач)

| Тема | Описание | Количество |
|------|----------|------------|
| **Classes** | Классы, конструкторы, наследование, абстрактные классы | 5 задач |
| **Mixins** | Миксины, композиция, ограничения (on) | 5 задач |
| **Async** | Future, async/await, обработка ошибок | 5 задач |
| **Streams** | Stream, StreamController, трансформации | 5 задач |

### Часть 2: Принципы SOLID (25 задач)

| Принцип | Описание | Количество |
|---------|----------|------------|
| **SRP** | Single Responsibility - один класс = одна ответственность | 5 задач |
| **OCP** | Open/Closed - открыт для расширения, закрыт для модификации | 5 задач |
| **LSP** | Liskov Substitution - подклассы должны заменять родительские | 5 задач |
| **ISP** | Interface Segregation - много маленьких интерфейсов лучше одного большого | 5 задач |
| **DIP** | Dependency Inversion - зависимость от абстракций, не от конкретных классов | 5 задач |

### Уровни сложности (для части 1)

| Уровень | Описание | Количество на тему |
|---------|----------|--------------------|
| Easy | Базовые концепции | 2 задачи |
| Medium | Комбинирование концепций | 2 задачи |
| Hard | Продвинутые техники | 1 задача |

---

## Рекомендуемый порядок обучения

### Этап 1: Базовые концепции (Easy)

Сначала решите все легкие задачи:

```
1. tasks/classes/task_01_easy.dart
2. tasks/classes/task_02_easy.dart
3. tasks/mixins/task_01_easy.dart
4. tasks/mixins/task_02_easy.dart
5. tasks/async/task_01_easy.dart
6. tasks/async/task_02_easy.dart
7. tasks/streams/task_01_easy.dart
8. tasks/streams/task_02_easy.dart
```

### Этап 2: Базовые концепции (Medium)

```
9. tasks/classes/task_03_medium.dart
10. tasks/classes/task_04_medium.dart
11. tasks/mixins/task_03_medium.dart
12. tasks/mixins/task_04_medium.dart
13. tasks/async/task_03_medium.dart
14. tasks/async/task_04_medium.dart
15. tasks/streams/task_03_medium.dart
16. tasks/streams/task_04_medium.dart
```

### Этап 3: Базовые концепции (Hard)

```
17. tasks/classes/task_05_hard.dart
18. tasks/mixins/task_05_hard.dart
19. tasks/async/task_05_hard.dart
20. tasks/streams/task_05_hard.dart
```

### Этап 4: SOLID принципы

После освоения базовых концепций переходите к SOLID:

```
SRP: tasks/solid/srp/task_01.dart ... task_05.dart
OCP: tasks/solid/ocp/task_01.dart ... task_05.dart
LSP: tasks/solid/lsp/task_01.dart ... task_05.dart
ISP: tasks/solid/isp/task_01.dart ... task_05.dart
DIP: tasks/solid/dip/task_01.dart ... task_05.dart
```

---

## Как работать с задачами

### Для базовых концепций (classes, mixins, async, streams)

1. Откройте файл задачи
2. Прочитайте описание и требования
3. Напишите код в функции `main()`
4. Запустите и проверьте результат

```bash
dart tasks/classes/task_01_easy.dart
```

### Для задач SOLID

1. Откройте файл задачи
2. Изучите "проблемный" код с нарушением принципа
3. Напишите исправленную версию в конце файла
4. Сравните с решением

```bash
# Запуск исходного кода (с нарушением)
dart tasks/solid/srp/task_01.dart

# Посмотреть решение
dart solutions/solid/srp/task_01_solution.dart
```

---

## Структура проекта

```
kumbel_lab_m1_l4/
│
├── tasks/
│   ├── classes/                    # Задачи по классам
│   │   ├── task_01_easy.dart
│   │   ├── task_02_easy.dart
│   │   ├── task_03_medium.dart
│   │   ├── task_04_medium.dart
│   │   └── task_05_hard.dart
│   │
│   ├── mixins/                     # Задачи по миксинам
│   │   └── ...
│   │
│   ├── async/                      # Задачи по асинхронности
│   │   └── ...
│   │
│   ├── streams/                    # Задачи по стримам
│   │   └── ...
│   │
│   └── solid/                      # Задачи по SOLID
│       ├── srp/                    # Single Responsibility
│       │   ├── task_01.dart
│       │   └── ...
│       ├── ocp/                    # Open/Closed
│       ├── lsp/                    # Liskov Substitution
│       ├── isp/                    # Interface Segregation
│       └── dip/                    # Dependency Inversion
│
└── solutions/                      # Готовые решения
    ├── classes/
    ├── mixins/
    ├── async/
    ├── streams/
    └── solid/
        ├── srp/
        ├── ocp/
        ├── lsp/
        ├── isp/
        └── dip/
```

---

## Краткое описание SOLID

### S - Single Responsibility Principle (SRP)
**Каждый класс должен иметь только одну причину для изменения.**

Плохо: User класс сохраняет в БД и отправляет email
Хорошо: User, UserRepository, EmailService

### O - Open/Closed Principle (OCP)
**Классы должны быть открыты для расширения, но закрыты для модификации.**

Плохо: switch/case для каждого нового типа
Хорошо: абстракции и полиморфизм

### L - Liskov Substitution Principle (LSP)
**Подклассы должны полностью заменять родительские классы.**

Плохо: Square extends Rectangle (меняет поведение)
Хорошо: оба реализуют Shape

### I - Interface Segregation Principle (ISP)
**Клиенты не должны зависеть от интерфейсов, которые не используют.**

Плохо: Worker с методами work(), eat(), sleep() для робота
Хорошо: Workable, Eatable, Sleepable

### D - Dependency Inversion Principle (DIP)
**Зависимость от абстракций, а не от конкретных реализаций.**

Плохо: UserService создает MySqlDatabase внутри
Хорошо: UserService принимает Database через конструктор

---

## Требования

- Dart SDK 2.17 или выше

```bash
dart --version
```

---

## Советы

1. **Не спешите** - лучше понять, чем быстро решить
2. **Пишите код сами** - не копируйте решения
3. **Экспериментируйте** - меняйте код и смотрите результат
4. **Объясняйте код** - проговаривайте решение вслух

---

**Удачи в изучении Dart и SOLID!**

_Создано для Kumbel Lab_
