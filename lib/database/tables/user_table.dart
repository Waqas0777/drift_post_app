import 'package:drift/drift.dart';
class UsersTable extends Table{

  IntColumn get userId => integer().autoIncrement()();
  TextColumn get userEmail => text().nullable()();
  TextColumn get userPassword => text().nullable()();

  // @override
  // Set<Column> get primaryKey => {id};
}