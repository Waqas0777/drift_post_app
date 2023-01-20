import 'package:drift/drift.dart';
import 'package:drift_post_app/database/tables/user_table.dart';
import '../app_database.dart';
import '../tables/profile_table.dart';
part 'profile_table_dao.g.dart';


@DriftAccessor(tables:[ProfileTable,UsersTable])
class ProfileTableDao extends DatabaseAccessor<AppDatabase> with _$ProfileTableDaoMixin {

  final AppDatabase db;
  ProfileTableDao( this.db): super(db);

  Future<int> addUserProfile(ProfileTableCompanion entry){
    return into(profileTable).insert(entry);
  }

  Future updateProfile(ProfileTableCompanion profile) => update(profileTable).replace(profile);

  Future deleteProfile(ProfileTableCompanion profile) => delete(profileTable).delete(profile);



}