import 'package:bloc/bloc.dart';
import 'package:drift_post_app/database/app_database.dart';
import 'package:drift_post_app/database/dao/user_table_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart' as drift;
import '../../../main.dart';
import '../../profile_screen/profile_screen.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void submittedData(
      BuildContext context, String userEmail, String userPassword) {
    validateUser(context, userEmail, userPassword).then((value) async {
      if (value) {
        // log("print $value");
        emit(UserSuccessState());
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
              return const ProfileScreen();
            }));
      } else {
        //log("Empty $value");
        emit(UserErrorState());
      }
    }).onError((error, stackTrace) {
      emit(UserErrorState());
    });
  }

  Future<bool> validateUser(
    context,
    String userEmail,
    String userPassword,
  ) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    if (userEmail.isEmpty || userPassword.isEmpty) {
      return false;
    } else {
      final entity = UsersTableCompanion(
        user_email: drift.Value(userEmail),
        user_password: drift.Value(userPassword),
      );

      getIt<AppDatabase>().usersTableDao.addUser(entity).then((value) {
        Fluttertoast.showToast(
            msg: "Record Added Successfully",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

      });

      return true;
    }
  }
}














// if (value) {
// log("print $value");
// //emit(RegistrationLoadingState());
// //emit(RegistrationSuccessState());
// // Future.delayed(const Duration(seconds: 2), () async {
// //   //getAllEmployees();
// //   // getIt<AppDb>().getEmployees.listen((event) { });
// // });
// } else {
// // emit(RegistrationLoadingState());
// //emit(RegistrationErrorState());
//
// // Future.delayed(const Duration(seconds: 2), () {
// // });
// }
