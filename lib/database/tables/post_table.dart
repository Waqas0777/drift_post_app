import 'package:drift/drift.dart';

class PostTable extends Table {

  IntColumn get postId => integer().autoIncrement()();
 // IntColumn get userId => integer().nullable().customConstraint("NULL REFERENCES userTable(userId)")();
 // IntColumn get age => integer().nullable()();
  TextColumn get postName => text().nullable()();
  TextColumn get postDescription => text().nullable()();
 // IntColumn get phoneNumber => integer().nullable()();
  BlobColumn get thumbnailImg => blob().nullable()();


}