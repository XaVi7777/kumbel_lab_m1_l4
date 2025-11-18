// Решение OCP задачи 3: Фильтрация продуктов

class Product {
  String name;
  String color;
  double price;
  String category;

  Product(this.name, this.color, this.price, this.category);
}

abstract class Specification {
  bool isSatisfied(Product product);
}

class ColorSpec implements Specification {
  final String color;
  ColorSpec(this.color);

  @override
  bool isSatisfied(Product product) => product.color == color;
}

class PriceSpec implements Specification {
  final double maxPrice;
  PriceSpec(this.maxPrice);

  @override
  bool isSatisfied(Product product) => product.price <= maxPrice;
}

class CategorySpec implements Specification {
  final String category;
  CategorySpec(this.category);

  @override
  bool isSatisfied(Product product) => product.category == category;
}

class AndSpec implements Specification {
  final List<Specification> specs;
  AndSpec(this.specs);

  @override
  bool isSatisfied(Product product) {
    return specs.every((spec) => spec.isSatisfied(product));
  }
}

class ProductFilter {
  List<Product> filter(List<Product> products, Specification spec) {
    return products.where((p) => spec.isSatisfied(p)).toList();
  }
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
  for (var p in filter.filter(products, ColorSpec('красный'))) {
    print('  - ${p.name}');
  }

  print('\nТовары до 2000 руб:');
  for (var p in filter.filter(products, PriceSpec(2000))) {
    print('  - ${p.name}: ${p.price} руб.');
  }

  print('\nКрасная одежда:');
  var spec = AndSpec([ColorSpec('красный'), CategorySpec('одежда')]);
  for (var p in filter.filter(products, spec)) {
    print('  - ${p.name}');
  }
}
