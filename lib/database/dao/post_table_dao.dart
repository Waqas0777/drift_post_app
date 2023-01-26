import 'package:drift/drift.dart';
import 'package:drift_post_app/database/tables/user_registration_table.dart';
import '../app_database.dart';
import '../tables/post_table.dart';
part 'post_table_dao.g.dart';


@DriftAccessor(tables:[PostTable,UserRegistrationTable])
class PostTableDao extends DatabaseAccessor<AppDatabase> with _$PostTableDaoMixin {

  final AppDatabase db;
  PostTableDao( this.db): super(db);
  Stream<List<PostTableData>> get getPosts => select(postTable).watch();

  Future<int> addUserProfile(PostTableCompanion entry){
    return into(postTable).insert(entry);
  }

  Future updateProfile(PostTableCompanion postTable) => update(postRegistrationTable).replace(postTable);

  Future deleteProfile(PostTableCompanion postTable) => delete(postRegistrationTable).delete(postTable);



}