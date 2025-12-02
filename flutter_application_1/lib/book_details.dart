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
  void initState() {
    super.initState();
    checkFavorite();
  }

  void checkFavorite() async {
    final favs = await FavoritesService.getFavorites();
    setState(() {
      isFavorite = favs.any((b) => b.id == widget.book.id);
    });
  }

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
            Center(
              child: Image.network(
                b.imageUrl,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/book_placeholder.png',
                    height: 200,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
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
            Expanded(child: SingleChildScrollView(child: Text(b.description))),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.favorite),
                onPressed: () async {
                  if (!isFavorite) {
                    await FavoritesService.addFavorite(b);
                  }
                  setState(() => isFavorite = true);
                },
                label: Text(isFavorite ? "Добавлено" : "Добавить в избранное"),
              ),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
