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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  factory SourceModel.fromEntity(SourceEntity entity) => SourceModel(
        id: entity.id,
        name: entity.name,
      );
}
