import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';

import '../models/article_model.dart';
import '../services/news_service.dart';
import '../widgets/news_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.yellow),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder<List<ArticleModel>>(
          future: NewsService().getAllActicles(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<ArticleModel> articles = snapshot.data!;
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(child: CategoriesListView()),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 32,
                    ),
                  ),
                  NewsListView(articles: articles),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        // child: Column(
        //   children: [
        //     CategoriesListView(),
        //     SizedBox(
        //       height: 32,
        //     ),
        //     Expanded(child: NewsListView()),
        //   ],
        // ),
      ),
    );
  }
}
