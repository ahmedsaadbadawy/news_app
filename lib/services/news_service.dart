import 'package:dio/dio.dart';
import '../models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getAllActicles({required String category}) async {
    var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f053e90bfb034dc7acc135d4064e041b');

    Map<String, dynamic> jsonData = response.data;

    List<dynamic> articles = jsonData['articles'];

    List<ArticleModel> articleList = [];

    for (var article in articles) {
      articleList.add(ArticleModel.fromJson(article));
    }

    return articleList;
  }
}
