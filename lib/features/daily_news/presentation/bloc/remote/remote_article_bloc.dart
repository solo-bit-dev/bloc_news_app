import 'package:bloc_news_app/core/resources/data_state.dart';
import 'package:bloc_news_app/features/daily_news/domain/use_cases/fetch_article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'remote_article_event.dart';
import 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final FetchArticleUseCase _fetchArticleUseCase;

  RemoteArticleBloc(this._fetchArticleUseCase) : super(const RemoteArticleLoading()) {
    on<FetchArticles>(onFetchArticles);
  }

  void onFetchArticles(FetchArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _fetchArticleUseCase.call();

    if (dataState is DataSuccess && dataState.data != null && dataState.data!.isNotEmpty) {
      print('DataState: ${dataState.data}');

      emit(RemoteArticleLoaded(articles: dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteArticleError(exception: dataState.error!));
    }
  }
}
