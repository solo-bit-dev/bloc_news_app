import '../../domain/entity/article_entity.dart';

class SourceModel extends SourceEntity {
  const SourceModel({
    super.id,
    super.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
      );
}
