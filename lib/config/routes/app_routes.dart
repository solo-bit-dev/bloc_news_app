import 'package:bloc_news_app/features/daily_news/presentation/pages/article_details/article_detail.dart';
import 'package:bloc_news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:bloc_news_app/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:flutter/material.dart';

class AppRoutes {

  AppRoutes._();

  static const String initialRoute = DailyNews.routeName;

  static final Map<String, Widget Function(BuildContext)> routes = {
    DailyNews.routeName: (context) => const DailyNews(),
    ArticleDetailsScreen.routeName: (context) => const ArticleDetailsScreen(),
    SavedArticleScreen.routeName: (context) => const SavedArticleScreen(),
  };
}
