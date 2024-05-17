import 'package:bloc_news_app/core/use_cases/data_state.dart';
import 'package:bloc_news_app/features/daily_news/data/models/article_model.dart';
import 'package:bloc_news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
  
}