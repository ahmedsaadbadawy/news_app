import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class NewsService {
  Future<List<ArticleModel>> getAllActicles({required String category}) async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f053e90bfb034dc7acc135d4064e041b'));
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<dynamic> articles = jsonData['articles'];
    List<ArticleModel> articleList = [];
    for (var article in articles) {
      articleList.add(ArticleModel.fromJson(article));
    }

    return articleList;
  }
}
