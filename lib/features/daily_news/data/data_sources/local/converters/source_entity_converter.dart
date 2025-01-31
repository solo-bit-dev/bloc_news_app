import 'dart:convert';

import 'package:bloc_news_app/features/daily_news/data/models/source_model.dart';
import 'package:floor/floor.dart';

import '../../../../domain/entity/article_entity.dart';

class SourceEntityConverter extends TypeConverter<SourceEntity?, String?> {
  @override
  SourceEntity? decode(String? databaseValue) {
    return databaseValue == null ? null : SourceModel.fromJson(json.decode(databaseValue));
  }

  @override
  String? encode(SourceEntity? value) {
    return value == null ? null : json.encode((value as SourceModel).toJson());
  }
}
