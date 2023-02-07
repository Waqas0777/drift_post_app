import 'package:drift_post_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/app_database.dart';

class SharedPreferencesModel {
  final SharedPreferences prefs;

  SharedPreferencesModel(this.prefs);

  void setLoginStatus(bool value) {
    prefs.setBool("loginStatus", value);
  }

  bool getLoginStatus() {
    return prefs.getBool("loginStatus") ?? false;
  }

  void setLoginEmail(String value) {
    prefs.setString("loginEmail", value);
  }

  void removeEmail() {
    prefs.remove("loginEmail");
  }

  String getLoginEmail() {
    return prefs.getString("loginEmail") ?? "";
  }
// Stream<List<PostTableData>> postList(){
//
//   return getIt<AppDatabase>().postTableDao.getAllPostsByEmailAddress;
// }
}
