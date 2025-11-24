import '../models/book.dart';

class BookApi {
  static Future<List<Book>> searchBooks(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Book(
        id: "1",
        title: "Война и мир",
        author: "Лев Толстой",
        year: "1869",
        description: "Роман-эпопея о войне 1812 года.",
        imageUrl: "https://covers.openlibrary.org/b/id/7222246-L.jpg",
      ),
      Book(
        id: "2",
        title: "Мастер и Маргарита",
        author: "Михаил Булгаков",
        year: "1967",
        description: "Роман о дьяволе, любви и Москве.",
        imageUrl: "https://covers.openlibrary.org/b/id/8231856-L.jpg",
      ),
    ];
  }
}
