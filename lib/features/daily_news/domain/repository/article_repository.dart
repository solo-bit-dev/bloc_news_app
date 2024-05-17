import 'package:bloc_news_app/core/resources/data_state.dart';
import 'package:bloc_news_app/features/daily_news/domain/entity/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
