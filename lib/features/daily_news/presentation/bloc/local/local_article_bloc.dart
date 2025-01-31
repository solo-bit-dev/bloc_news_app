import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_news_app/features/daily_news/domain/use_cases/get_saved_article.dart';
import 'package:bloc_news_app/features/daily_news/domain/use_cases/remove_article.dart';
import 'package:bloc_news_app/features/daily_news/domain/use_cases/save_article.dart';
import 'package:bloc_news_app/features/daily_news/presentation/bloc/local/local_article_event.dart';
import 'package:bloc_news_app/features/daily_news/presentation/bloc/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticleLoadingState()) {
    on<GetSavedArticlesEvent>(onGetSavedArticles);
    on<SaveArticleEvent>(onSaveArticle);
    on<RemoveArticleEvent>(onRemoveArticle);
  }

  void onGetSavedArticles(GetSavedArticlesEvent event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase.call();
    emit(LocalArticleLoadedState(articles: articles));
  }

  void onSaveArticle(SaveArticleEvent event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase.call(params: event.article);
    final articles = await _getSavedArticleUseCase.call();
    emit(LocalArticleLoadedState(articles: articles));
  }

  void onRemoveArticle(RemoveArticleEvent event, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase.call(params: event.article);
    final articles = await _getSavedArticleUseCase.call();
    emit(LocalArticleLoadedState(articles: articles));
  }
}
