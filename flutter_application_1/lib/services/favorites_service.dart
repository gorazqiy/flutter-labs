import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book.dart';

class FavoritesService {
  static const _key = "favorites";

  static Future<List<Book>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];
    final List list = json.decode(jsonString);
    return list.map((e) => Book.fromJson(e)).toList();
  }

  static Future<void> saveFavorites(List<Book> books) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(books.map((b) => b.toJson()).toList());
    await prefs.setString(_key, jsonString);
  }

  static Future<void> addFavorite(Book book) async {
    final favs = await getFavorites();
    favs.add(book);
    await saveFavorites(favs);
  }

  static Future<void> removeFavorite(String id) async {
    final favs = await getFavorites();
    favs.removeWhere((b) => b.id == id);
    await saveFavorites(favs);
  }
}
