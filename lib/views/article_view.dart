import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_app_bar.dart';

import '../models/article_model.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().appBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                article.author == null ? '' : 'Author : ${article.author}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 18,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  '${article.imageUrl}',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/broken-image.jpg',
                      height: 200,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Text(
                article.title ?? '',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 1.5,
                height: 22,
              ),
              const SizedBox(
                height: 18,
              ),
              if (article.description != null)
                Text(
                  article.description ?? '',
                  style: const TextStyle(fontSize: 20),
                ),
              const SizedBox(
                height: 18,
              ),
              Text(
                article.url ?? '',
                style: const TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
