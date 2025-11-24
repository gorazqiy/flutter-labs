import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class BookApi {
  static Future<List<Book>> searchBooks(String query, {int limit = 10}) async {
    final url = Uri.parse(
      'https://openlibrary.org/search.json?q=$query&limit=$limit',
    );
    final response = await http.get(url);

    if (response.statusCode != 200)
      throw Exception('Ошибка API: ${response.statusCode}');

    final data = json.decode(response.body);
    final List docs = data['docs'];

    return docs.map((doc) {
      return Book(
        id: doc['key'] ?? '',
        title: doc['title'] ?? 'Нет названия',
        author: (doc['author_name'] != null && doc['author_name'].isNotEmpty)
            ? doc['author_name'][0]
            : 'Неизвестный автор',
        description: 'Нет описания',
        year: doc['first_publish_year']?.toString() ?? 'Неизвестно',
        imageUrl: doc['cover_i'] != null
            ? 'https://covers.openlibrary.org/b/id/${doc['cover_i']}-L.jpg'
            : 'https://via.placeholder.com/150',
      );
    }).toList();
  }
}
