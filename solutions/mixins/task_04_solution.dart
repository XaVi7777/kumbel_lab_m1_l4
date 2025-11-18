// Решение задачи 4: Порядок миксинов и переопределение методов

class Base {
  String greet() => 'Base';
}

mixin A on Base {
  @override
  String greet() => '${super.greet()} -> A';
}

mixin B on Base {
  @override
  String greet() => '${super.greet()} -> B';
}

class TestAB extends Base with A, B {}

class TestBA extends Base with B, A {}

void main() {
  var testAB = TestAB();
  var testBA = TestBA();

  print('TestAB (Base with A, B): ${testAB.greet()}');
  print('TestBA (Base with B, A): ${testBA.greet()}');
}
