// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:bloc_news_app/core/constants/constants.dart';
import 'package:bloc_news_app/features/daily_news/data/models/article_model.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
