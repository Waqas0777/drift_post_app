import 'package:drift/drift.dart';

class ProfileTable extends Table{

  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().nullable().customConstraint("NULL REFERENCES userTable(userId)")();
  IntColumn get age => integer().nullable()();
  TextColumn get userName => text().nullable()();
  IntColumn get phoneNumber => integer().nullable()();
  BlobColumn get thumbnailImg => blob().nullable()();


}