// ignore_for_file: non_constant_identifier_names

class News {
  final String title;
  final String description;
  final String date;
  final String author;
  final String url_path;

  News({
    required this.title,
    required this.description,
    required this.date,
    required this.author,
    required this.url_path,
  });

  News.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        date = json['date'],
        author = json['author'],
        url_path = json['url_path'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'date': date,
        'author': author,
        'url_path': url_path,
      };
}
