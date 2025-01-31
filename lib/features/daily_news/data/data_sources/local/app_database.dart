import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/article_model.dart';
import 'DAO/article_dao.dart';
import 'converters/date_time_converter.dart';
import 'converters/source_entity_converter.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
@TypeConverters([SourceEntityConverter, DateTimeConverter])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
