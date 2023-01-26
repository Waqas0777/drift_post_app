import 'package:drift_post_app/database/tables/post_table.dart';
import 'package:drift_post_app/database/tables/user_registration_table.dart';

class ProfileWithUser{
  final PostTable profileTable;
  final UserRegistrationTable usersTable;

  ProfileWithUser(this.profileTable, this.usersTable);
}