import 'package:bloc_news_app/core/resources/data_state.dart';
import 'package:bloc_news_app/features/daily_news/domain/entity/article_entity.dart';

abstract class ArticleRepository {

  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);

}
