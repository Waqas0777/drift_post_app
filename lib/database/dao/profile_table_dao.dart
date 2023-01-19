import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/profile_table.dart';
part 'profile_table_dao.g.dart';


@DriftAccessor(tables:[ProfileTable])
class ProfileTableDao extends DatabaseAccessor<AppDatabase> with _$ProfileTableDaoMixin {

  final AppDatabase db;
  ProfileTableDao( this.db): super(db);

  Future<int> add_user_profile(ProfileTableCompanion entry){
    return into(profileTable).insert(entry);
  }

  Future updateProfile(ProfileTableCompanion profile) => update(profileTable).replace(profile);

  Future deleteProfile(ProfileTableCompanion profile) => delete(profileTable).delete(profile);



}