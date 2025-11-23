import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Информация о книге"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.book, size: 60, color: Colors.black45),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Название книги",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text("Автор: Имя Автора", style: TextStyle(fontSize: 18)),

            const SizedBox(height: 16),

            const Text(
              "Описание:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            const Text(
              "Здесь находится краткое описание книги. "
              "На данном этапе текст является заглушкой, так как логика загрузки данных ещё не реализована.",
              style: TextStyle(fontSize: 16),
            ),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: null,
                    child: const Text("Редактировать"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Удалить"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
