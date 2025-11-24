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

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'author': author,
    'description': description,
    'imageUrl': imageUrl,
    'year': year,
    'rating': rating,
  };

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json['id'],
    title: json['title'],
    author: json['author'],
    description: json['description'],
    imageUrl: json['imageUrl'],
    year: json['year'],
    rating: json['rating'] ?? 0,
  );
}
