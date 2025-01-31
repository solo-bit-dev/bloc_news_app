import 'package:bloc_news_app/core/usecases/usecase.dart';
import 'package:bloc_news_app/features/daily_news/domain/entity/article_entity.dart';
import 'package:bloc_news_app/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
