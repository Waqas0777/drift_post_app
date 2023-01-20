import 'package:drift_post_app/database/tables/profile_table.dart';
import 'package:drift_post_app/database/tables/user_table.dart';

class ProfileWithUser{
  final ProfileTable profileTable;
  final UsersTable usersTable;

  ProfileWithUser(this.profileTable, this.usersTable);
}