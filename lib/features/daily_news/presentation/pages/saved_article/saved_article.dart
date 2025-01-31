import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../../domain/entity/article_entity.dart';
import '../../bloc/local/local_article_bloc.dart';
import '../../bloc/local/local_article_event.dart';
import '../../bloc/local/local_article_state.dart';
import '../../widgets/article_widget.dart';
import '../../widgets/fallback_widget.dart';
import '../article_details/article_detail.dart';

class SavedArticleScreen extends StatelessWidget {
  const SavedArticleScreen({super.key});

  static const routeName = '/saved-articles';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _onBackButtonTapped(context),
            child: const Icon(
              Ionicons.chevron_back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text('Saved Articles', style: TextStyle(color: Colors.black)),
      ),
      body: BlocBuilder<LocalArticleBloc, LocalArticleState>(
        builder: (context, state) {
          if (state is LocalArticleLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LocalArticleLoadedState) {
            return _buildArticlesList(state.articles);
          } else {
            return FallbackWidget();
          }
        },
      ),
    );
  }

  Widget _buildArticlesList(List<ArticleEntity>? articles) {
    return (articles == null || articles.isEmpty)
        ? const Center(
            child: Text('No saved articles'),
          )
        : ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: articles[index],
                isRemovable: true,
                onRemove: (article) => _onArticleRemoved(context, article),
                onArticlePressed: (article) => _onArticlePressed(context, article),
              );
            },
          );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onArticleRemoved(BuildContext context, ArticleEntity article) {
    log('SavedArticleScreen._onArticleRemoved: article: ${article.title}');
    BlocProvider.of<LocalArticleBloc>(context).add(RemoveArticleEvent(article: article));
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, ArticleDetailsScreen.routeName, arguments: article);
  }
}
