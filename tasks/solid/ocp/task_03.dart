// SOLID - Open/Closed Principle (Принцип открытости/закрытости)
// Задача 3: Фильтрация продуктов
//
// ПРОБЛЕМА В КОДЕ:
// Каждый новый критерий фильтрации требует добавления нового метода.
// Комбинация фильтров приводит к комбинаторному взрыву методов.
//
// ЗАДАНИЕ:
// Создайте интерфейс Specification с методом isSatisfied(Product).
// Реализуйте ColorSpec, PriceSpec, CategorySpec.
// Создайте AndSpec для комбинации критериев.

// === КОД С НАРУШЕНИЕМ OCP ===

class Product {
  String name;
  String color;
  double price;
  String category;

  Product(this.name, this.color, this.price, this.category);
}

class ProductFilter {
  List<Product> filterByColor(List<Product> products, String color) {
    return products.where((p) => p.color == color).toList();
  }

  List<Product> filterByPrice(List<Product> products, double maxPrice) {
    return products.where((p) => p.price <= maxPrice).toList();
  }

  List<Product> filterByCategory(List<Product> products, String category) {
    return products.where((p) => p.category == category).toList();
  }

  // Комбинации? Нужно добавлять все больше методов!
  List<Product> filterByColorAndPrice(List<Product> products, String color, double maxPrice) {
    return products.where((p) => p.color == color && p.price <= maxPrice).toList();
  }

  // filterByColorAndCategory, filterByPriceAndCategory...
  // Это бесконечно!
}

void main() {
  var products = [
    Product('Футболка', 'красный', 1500, 'одежда'),
    Product('Джинсы', 'синий', 3000, 'одежда'),
    Product('Кроссовки', 'белый', 5000, 'обувь'),
    Product('Шапка', 'красный', 800, 'аксессуары'),
  ];

  var filter = ProductFilter();

  print('Красные товары:');
  for (var p in filter.filterByColor(products, 'красный')) {
    print('  - ${p.name}');
  }

  print('\nТовары до 2000 руб:');
  for (var p in filter.filterByPrice(products, 2000)) {
    print('  - ${p.name}: ${p.price} руб.');
  }
}

// === НАПИШИТЕ ИСПРАВЛЕННЫЙ КОД НИЖЕ ===
