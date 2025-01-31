import 'package:bloc_news_app/features/daily_news/domain/entity/article_entity.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object?> get props => [article];
}

class GetSavedArticlesEvent extends LocalArticleEvent {
  const GetSavedArticlesEvent();
}

class SaveArticleEvent extends LocalArticleEvent {
  const SaveArticleEvent({required ArticleEntity article}) : super(article: article);
}

class RemoveArticleEvent extends LocalArticleEvent {
  const RemoveArticleEvent({required ArticleEntity article}) : super(article: article);
}
