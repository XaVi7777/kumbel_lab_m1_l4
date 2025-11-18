// Решение задачи 1: Первый класс - Книга

class Book {
  String title;
  String author;
  int pages;

  Book(this.title, this.author, this.pages);

  String getInfo() {
    return 'Книга: "$title", Автор: $author, Страниц: $pages';
  }
}

void main() {
  var book = Book('Война и мир', 'Лев Толстой', 1225);
  print(book.getInfo());
}
