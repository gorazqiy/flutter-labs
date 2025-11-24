class Book {
  final String id;
  String title;
  String author;
  String description;
  String imageUrl;
  String year;
  int rating;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.year,
    this.rating = 0,
  });
}
