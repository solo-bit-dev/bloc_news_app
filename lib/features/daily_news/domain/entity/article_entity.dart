 import 'package:equatable/equatable.dart';

 part 'source_entity.dart';

class ArticleEntity extends Equatable{
  final SourceEntity? source;
  final String? author;
  final String? title;
  final dynamic description;
  final String? url;
  final dynamic urlToImage;
  final DateTime? publishedAt;
  final dynamic content;


  const ArticleEntity({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  
  @override
  List<Object?> get props => [
    source,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];
}
