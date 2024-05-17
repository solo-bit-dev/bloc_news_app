import 'package:bloc_news_app/features/daily_news/domain/entity/article_entity.dart';

class ArticleModel extends ArticleEntity {
  ArticleModel({
    super.source,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        source: json["source"] == null ? null : sourceFromJson(json["source"] as Map<String, dynamic>),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  static sourceFromJson(Map<String, dynamic> json) => SourceEntity(
        id: json["id"],
        name: json["name"],
      );
}
