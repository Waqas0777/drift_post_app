import 'package:drift/drift.dart';
import 'package:drift_post_app/database/tables/user_table.dart';
import '../app_database.dart';
part 'user_table_dao.g.dart';


@DriftAccessor(tables:[UsersTable])
class UsersTableDao extends DatabaseAccessor<AppDatabase> with _$UsersTableDaoMixin {

  final AppDatabase db;
  UsersTableDao( this.db): super(db);

  Stream<List<UsersTableData>> get getUsers => select(usersTable).watch();


  Future<int> addUser(UsersTableCompanion entry){
    return into(usersTable).insert(entry);
  }

  Future updateUser(UsersTableCompanion user) => update(usersTable).replace(user);

  Future deleteUser(UsersTableCompanion user) => delete(usersTable).delete(user);


}