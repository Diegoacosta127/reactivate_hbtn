class Book {
  String title = '';
  String author = '';

  Book(this.title, this.author);
  Book.untitled() : title = 'Untitled', author = 'Unknown';
}

void main() {
  var custom = Book('1984', 'George Orwell');
  var defaultBook = Book.untitled();
  print('${custom.title}, by ${custom.author}');
  print('${defaultBook.title}, by ${defaultBook.author}');
}
