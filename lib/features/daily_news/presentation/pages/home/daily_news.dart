import 'dart:developer';

import 'package:bloc_news_app/features/daily_news/domain/entity/article_entity.dart';
import 'package:bloc_news_app/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:bloc_news_app/features/daily_news/presentation/bloc/remote/remote_article_state.dart';
import 'package:bloc_news_app/features/daily_news/presentation/pages/article_details/article_detail.dart';
import 'package:bloc_news_app/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:bloc_news_app/features/daily_news/presentation/widgets/article_widget.dart';
import 'package:bloc_news_app/features/daily_news/presentation/widgets/fallback_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () => _onPressBookmark(context),
          ),
        ],
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          if (state is RemoteArticleLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is RemoteArticleErrorState) {
            log('Error: ${state.exception?.error}');

            return const Center(
              child: Icon(Icons.refresh),
            );
          } else if (state is RemoteArticleLoadedState) {
            return ListView.builder(
              itemCount: state.articles?.length,
              itemBuilder: (context, index) {
                return ArticleWidget(
                  article: state.articles![index],
                  onArticlePressed: (article) => _onArticlePressed(context, article),
                );
              },
            );
          } else {
            return FallbackWidget();
          }
        },
      ),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    log('Article pressed: ${article.title}');
    Navigator.pushNamed(context, ArticleDetailsScreen.routeName, arguments: article);
  }

  void _onPressBookmark(BuildContext context) {
    Navigator.pushNamed(context, SavedArticleScreen.routeName);
  }
}
