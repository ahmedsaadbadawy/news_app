class ArticleModel {
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? url;
  final String? author;

  ArticleModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
    required this.author,
  });

  factory ArticleModel.fromJson(jsonData) {
    return ArticleModel(
      title: jsonData['title'],
      description: jsonData['description'],
      imageUrl: jsonData['urlToImage'],
      url: jsonData['url'],
      author: jsonData['author'],
    );
  }
}
