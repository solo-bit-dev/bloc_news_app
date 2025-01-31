import 'package:bloc_news_app/core/usecases/usecase.dart';
import 'package:bloc_news_app/features/daily_news/domain/entity/article_entity.dart';
import 'package:bloc_news_app/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
