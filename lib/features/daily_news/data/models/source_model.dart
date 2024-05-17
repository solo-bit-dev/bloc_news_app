part of 'article_model.dart';

class Source {
  final String? id;
  final String? name;

  const Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
