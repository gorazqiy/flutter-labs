import 'package:flutter/material.dart';
import 'models/book.dart';
import 'services/favorites_service.dart';

class BookDetails extends StatefulWidget {
  final Book book;

  const BookDetails({super.key, required this.book});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final b = widget.book;

    return Scaffold(
      appBar: AppBar(title: Text(b.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(b.imageUrl, height: 200)),
            const SizedBox(height: 20),
            Text(
              b.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text("Автор: ${b.author}", style: const TextStyle(fontSize: 18)),
            Text("Год: ${b.year}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text(
              "Описание:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(b.description),

            const Spacer(),

            ElevatedButton.icon(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                FavoritesService.addFavorite(b);
                setState(() => isFavorite = true);
              },
              label: Text(isFavorite ? "Добавлено" : "Добавить в избранное"),
            ),
          ],
        ),
      ),
    );
  }
}
