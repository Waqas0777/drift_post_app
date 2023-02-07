import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/user_registration_table.dart';

part 'user_table_dao.g.dart';

@DriftAccessor(tables: [UserRegistrationTable])
class UsersTableDao extends DatabaseAccessor<AppDatabase>
    with _$UsersTableDaoMixin {
  final AppDatabase db;

  UsersTableDao(this.db) : super(db);

  Stream<List<UserRegistrationTableData>> get getUsers =>
      select(userRegistrationTable).watch();

  Future<int> addUser(UserRegistrationTableCompanion entry) {
    return into(userRegistrationTable).insert(entry);
  }

  // Future updateUser(UserRegistrationTableCompanion user) => update(userRegistrationTable).replace(user);
  //
  // Future deleteUser(UserRegistrationTableCompanion user) => delete(userRegistrationTable).delete(user);

  Future<UserRegistrationTableData> loginByEmailPassword(
      String email, String password) async {
    return await (select(userRegistrationTable)
          ..where((tbl) =>
              tbl.userEmail.equals(email) & tbl.userPassword.equals(password)))
        .getSingle();
    // await select(userRegistrationTable)..where((t) => t.userEmail.equals(email) & t.userPassword.equals(password));
  }
}
