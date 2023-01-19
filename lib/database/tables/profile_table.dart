import 'package:drift/drift.dart';

class ProfileTable extends Table{

  IntColumn get id => integer().autoIncrement()();
  IntColumn get age => integer().autoIncrement()();
  TextColumn get userName => text().nullable()();
  IntColumn get phoneNumber => integer().nullable()();
  BlobColumn get thumbnailImg => blob().nullable()();


}