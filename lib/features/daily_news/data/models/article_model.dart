import 'package:floor/floor.dart';

import '../../domain/entity/article_entity.dart';
import '../data_sources/local/converters/source_entity_converter.dart';
import 'source_model.dart';

@Entity(tableName: 'article')
class ArticleModel extends ArticleEntity {

  @PrimaryKey(autoGenerate: true)
  final int? id;

  const ArticleModel({
    this.id,
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
        source: json["source"] == null ? null : SourceModel.fromJson(json["source"] as Map<String, dynamic>),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}
