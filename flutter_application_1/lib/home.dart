import 'package:flutter/material.dart';
import 'book_details.dart';
import 'models/book.dart';
import 'services/book_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  List<Book> books = [];
  bool isLoading = false;

  void search() async {
    setState(() => isLoading = true);
    books = await BookApi.searchBooks(_searchController.text);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Каталог книг")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: "Поиск книги по названию",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: search, child: const Text("Поиск")),
            const SizedBox(height: 20),

            isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: books.length,
                      itemBuilder: (_, i) {
                        final b = books[i];
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              b.imageUrl,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(b.title),
                            subtitle: Text(b.author),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BookDetails(book: b),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
