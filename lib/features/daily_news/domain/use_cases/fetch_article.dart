import 'package:bloc_news_app/core/resources/data_state.dart';
import 'package:bloc_news_app/core/usecases/usecase.dart';
import 'package:bloc_news_app/features/daily_news/domain/entity/article_entity.dart';
import 'package:bloc_news_app/features/daily_news/domain/repository/article_repository.dart';

class FetchArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  FetchArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
