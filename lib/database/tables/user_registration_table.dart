import 'package:drift/drift.dart';
class UserRegistrationTable extends Table{

  // IntColumn get userId => integer()();
  TextColumn get userName => text().nullable()();
  TextColumn get userEmail => text()();
  TextColumn get userPassword => text().nullable()();

   @override
   Set<Column> get primaryKey => {userEmail};
}