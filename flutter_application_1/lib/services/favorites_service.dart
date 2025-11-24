import '../models/book.dart';

class FavoritesService {
  static final List<Book> _favorites = [];

  static List<Book> get favorites => _favorites;

  static void addFavorite(Book book) {
    _favorites.add(book);
  }

  static void removeFavorite(String id) {
    _favorites.removeWhere((b) => b.id == id);
  }
}
