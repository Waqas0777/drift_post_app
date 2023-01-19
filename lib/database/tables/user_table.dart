import 'package:drift/drift.dart';
class UsersTable extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get user_email => text().nullable()();
  TextColumn get user_password => text().nullable()();

  // @override
  // Set<Column> get primaryKey => {id};
}