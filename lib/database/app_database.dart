import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as path;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift_post_app/database/tables/post_table.dart';
import 'package:drift_post_app/database/tables/user_registration_table.dart';
import 'dao/post_table_dao.dart';
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

@DriftDatabase(
    tables: [PostTable, UserRegistrationTable],
    daos: [UsersTableDao, PostTableDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 7;

  //@override
  // MigrationStrategy get migration => MigrationStrategy(
  //       // Runs after all the migrations but BEFORE any queries have a chance to execute
  //
  //       beforeOpen: (details) async {
  //         // Make sure that foreign keys are enabled
  //         //await customStatement('PRAGMA foreign_keys = ON');
  //         if (from == 3) {
  //           await migrator.addColumn(tasks, tasks.tagName);
  //           await migrator.createTable(tags);
  //         }
  //       },
  //     );
  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (OpeningDetails details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
