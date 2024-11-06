class Book {
  String _title; // خاص
  String _author; // خاص
  int _publicationYear; // خاص

  Book(this._title, this._author, this._publicationYear);

  String get title => _title;
  String get author => _author;
  int get publicationYear => _publicationYear;
}

class User {
  String name;
  String membershipNumber;
  List<Book> borrowedBooks = [];

  User(this.name, this.membershipNumber);
}

class NormalUser extends User {
  NormalUser(String name, String membershipNumber) : super(name, membershipNumber);
}

class PremiumUser extends User {
  PremiumUser(String name, String membershipNumber) : super(name, membershipNumber);
}

abstract class LibraryOperations {
  void addBook(Book book);
  void deleteBook(String title);
  List<Book> search(String query);
}

class Library implements LibraryOperations {
  List<Book> books = [];

  @override
  void addBook(Book book) {
    books.add(book);
  }

  @override
  List<Book> search(String query) {
    return books.where((book) =>
        book.title.contains(query) ||
        book.author.contains(query) ||
        book.publicationYear.toString() == query).toList();
  }

  @override
  void deleteBook(String title) {
    books.removeWhere((book) => book.title == title);
  }
}

void main() {
  Library library = Library();
  library.addBook(Book("The Great Gatsby", "F. Scott Fitzgerald", 1925));
  library.addBook(Book("1984", "George Orwell", 1949));

  var foundBooks = library.search("1984");
  print(foundBooks.isNotEmpty ? "Found: ${foundBooks[0].title}" : "Book not found");

  library.deleteBook("The Great Gatsby");
}