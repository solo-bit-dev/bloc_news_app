part of 'article_entity.dart';

class SourceEntity extends Equatable {
  final String? id;
  final String? name;

  const SourceEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
