 import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable{
  // Source? source;
  String? author;
  String? title;
  dynamic description;
  String? url;
  dynamic urlToImage;
  DateTime? publishedAt;
  dynamic content;


  ArticleEntity({
    // this.source,
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
    // source,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];
}
