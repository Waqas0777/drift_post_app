import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as path;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift_post_app/database/tables/profile_table.dart';
import 'package:drift_post_app/database/tables/user_table.dart';

import 'dao/profile_table_dao.dart';
import 'dao/user_table_dao.dart';
part 'app_database.g.dart';
//specifying location to database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, "employeeDb.sqlite"));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [ProfileTable, UsersTable], daos: [UsersTableDao,ProfileTableDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}


