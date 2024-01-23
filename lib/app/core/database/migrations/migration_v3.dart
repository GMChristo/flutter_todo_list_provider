import 'package:flutter_to_do_list_provider/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV3 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('create table teste2(id integer)');
  }

  @override
  void upgrade(Batch batch) {
    batch.execute('create table teste2(id integer)');
  }
}
