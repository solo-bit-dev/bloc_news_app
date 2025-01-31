import 'package:equatable/equatable.dart';

import '../../../domain/entity/article_entity.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object?> get props => [articles];
}

class LocalArticleLoadingState extends LocalArticleState {
  const LocalArticleLoadingState();
}

class LocalArticleLoadedState extends LocalArticleState {
  const LocalArticleLoadedState({required List<ArticleEntity> articles}) : super(articles: articles);
}