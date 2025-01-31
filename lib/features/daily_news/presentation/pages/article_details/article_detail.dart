import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:intl/intl.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entity/article_entity.dart';
import '../../bloc/local/local_article_bloc.dart';
import '../../bloc/local/local_article_event.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  static const routeName = '/article-details';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as ArticleEntity?;

    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>(),
      child: Scaffold(
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildArticleTitleAndDate(article),
              _buildArticleImage(article),
              _buildArticleDescription(article),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onSaveButtonTapped(context, article),
          child: const Icon(Ionicons.bookmark, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildArticleTitleAndDate(ArticleEntity? article) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article?.title ?? '',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            article?.publishedAt != null ? DateFormat.yMMMd().format(article!.publishedAt!) : '',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleImage(ArticleEntity? article) {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: EdgeInsets.only(top: 12),

      // child: Image.network(
      //   article?.urlToImage ?? '',
      //   fit: BoxFit.cover,
      // ),
      child: Image.network(
        article?.urlToImage ?? '',
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return const Center(
            child: Text(
              '404\nNOT FOUND',
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

  Widget _buildArticleDescription(ArticleEntity? article) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: Text(
        '${article?.description ?? ''}\n\n${article?.content ?? ''}',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onSaveButtonTapped(BuildContext context, ArticleEntity? article) {
    // save article
    BlocProvider.of<LocalArticleBloc>(context).add(SaveArticleEvent(article: article!));

    // show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Article saved successfully!'),
      ),
    );
  }
}
