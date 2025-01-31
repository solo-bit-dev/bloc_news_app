import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

import 'package:bloc_news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:bloc_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:bloc_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:bloc_news_app/features/daily_news/domain/use_cases/fetch_article.dart';
import 'package:bloc_news_app/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';

import 'features/daily_news/data/data_sources/local/app_database.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // create database
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // dio
  sl.registerSingleton<Dio>(Dio());

  // dependencies
  sl.registerSingleton<NewsApiService>(
    NewsApiService(sl<Dio>()),
  );

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl<NewsApiService>()),
  );

  // use cases
  sl.registerSingleton<FetchArticleUseCase>(
    FetchArticleUseCase(sl<ArticleRepository>()),
  );

  // blocs
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl<FetchArticleUseCase>()),
  );
}
