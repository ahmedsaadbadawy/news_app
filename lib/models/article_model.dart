class ArticleModel {
  final String title;
  final String description;
  final String imageUrl;

  ArticleModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory ArticleModel.fromJson(jsonData) {
    return ArticleModel(
      title: jsonData['title'],
      description: jsonData['description'],
      imageUrl: jsonData['urlToImage'],
    );
  }
}
