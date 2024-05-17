// ignore: depend_on_referenced_packages
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

class RemoteArticleLoadingState extends RemoteArticleState {
  const RemoteArticleLoadingState();
}

class RemoteArticleLoadedState extends RemoteArticleState {
  const RemoteArticleLoadedState({required List<ArticleEntity> articles}) : super(articles: articles);
}

class RemoteArticleErrorState extends RemoteArticleState {
  const RemoteArticleErrorState({required DioException exception}) : super(exception: exception);
}
