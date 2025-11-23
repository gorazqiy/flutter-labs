import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Каталог книг'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Добавить новую книгу",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            const TextField(
              decoration: InputDecoration(
                hintText: "Введите название книги",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                child: const Text("Добавить"),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Список книг",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView(
                children: const [
                  BookCard(title: "Война и мир", author: "Лев Толстой"),
                  BookCard(
                    title: "Преступление и наказание",
                    author: "Фёдор Достоевский",
                  ),
                  BookCard(
                    title: "Мастер и Маргарита",
                    author: "Михаил Булгаков",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String author;

  const BookCard({super.key, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        subtitle: Text(author),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: null,
      ),
    );
  }
}
