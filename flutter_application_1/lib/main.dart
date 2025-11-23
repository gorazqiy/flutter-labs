import 'package:flutter/material.dart';
import 'home.dart'; // импорт твоего экрана (название файла может быть другим)
import 'BookDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Каталог книг',

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      home: const Home(),
      // home: const BookDetails(),
    );
  }
}
