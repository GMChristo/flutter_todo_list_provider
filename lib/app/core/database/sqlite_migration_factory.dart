import 'package:flutter_to_do_list_provider/app/core/database/migrations/migration.dart';
import 'package:flutter_to_do_list_provider/app/core/database/migrations/migration_v1.dart';
import 'package:flutter_to_do_list_provider/app/core/database/migrations/migration_v2.dart';
import 'package:flutter_to_do_list_provider/app/core/database/migrations/migration_v3.dart';

class SqliteMigrationFactory {
  List<Migration> getCretateMigration() => [
        MigrationV1(),
        MigrationV2(),
        MigrationV3(),
      ];

  List<Migration> getUpdateMigration(int version) {
    final migrations = <Migration>[];

    if (version == 1) {
      migrations.add(MigrationV2());
      migrations.add(MigrationV3());
    }
    if (version == 2) {
      migrations.add(MigrationV3());
    }
    return migrations;
  }
}
