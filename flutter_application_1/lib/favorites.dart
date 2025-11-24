import 'package:flutter/material.dart';
import 'models/book.dart';
import 'services/favorites_service.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesService.favorites;

    return Scaffold(
      appBar: AppBar(title: const Text("Избранное")),
      body: favorites.isEmpty
          ? const Center(child: Text("Пусто"))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (_, i) {
                Book b = favorites[i];
                return Card(
                  child: ListTile(
                    leading: Image.network(b.imageUrl, width: 50),
                    title: Text(b.title),
                    subtitle: Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < b.rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditFavoritePage(book: b),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            FavoritesService.removeFavorite(b.id);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class EditFavoritePage extends StatefulWidget {
  final Book book;
  const EditFavoritePage({super.key, required this.book});

  @override
  State<EditFavoritePage> createState() => _EditFavoritePageState();
}

class _EditFavoritePageState extends State<EditFavoritePage> {
  late TextEditingController titleController;
  late TextEditingController authorController;
  late TextEditingController yearController;
  late TextEditingController descriptionController;
  int rating = 0;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.book.title);
    authorController = TextEditingController(text: widget.book.author);
    yearController = TextEditingController(text: widget.book.year);
    descriptionController = TextEditingController(
      text: widget.book.description,
    );
    rating = widget.book.rating;
  }

  Widget buildStars() {
    return Row(
      children: List.generate(
        5,
        (index) => IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () => setState(() => rating = index + 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Редактировать книгу")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Название"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(labelText: "Автор"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: yearController,
              decoration: const InputDecoration(labelText: "Год"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: "Описание"),
              maxLines: null,
            ),
            const SizedBox(height: 20),
            const Text("Оценка:", style: TextStyle(fontSize: 16)),
            buildStars(),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.book.title = titleController.text;
                  widget.book.author = authorController.text;
                  widget.book.year = yearController.text;
                  widget.book.description = descriptionController.text;
                  widget.book.rating = rating;
                  Navigator.pop(context);
                },
                child: const Text("Сохранить"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
