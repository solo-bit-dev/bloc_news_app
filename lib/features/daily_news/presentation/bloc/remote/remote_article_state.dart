import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_news_app/features/daily_news/domain/entity/article_entity.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exception;

  const RemoteArticleState({this.articles, this.exception});

  @override
  List<Object?> get props => [articles, exception];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticleLoaded extends RemoteArticleState {
  const RemoteArticleLoaded({required List<ArticleEntity> articles}) : super(articles: articles);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError({required DioException exception}) : super(exception: exception);
}