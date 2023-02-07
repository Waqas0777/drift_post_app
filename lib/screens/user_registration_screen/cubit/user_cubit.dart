import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:drift_post_app/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart' as drift;
import '../../../main.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  void submittedData(BuildContext context, String userEmail, String userName,
      String userPassword) {
    validateUser(context, userEmail, userName, userPassword)
        .then((value) async {
      if (value) {
        //log("print $value");
        // Navigator.pop(context);
        emit(UserSuccessState());
      } else {
        //log("Empty $value");
        log("UserAlreadyexits $value");

        Fluttertoast.showToast(
            msg: "User Already exits",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(UserErrorState());
      }
    }).onError((error, stackTrace) {
      log("UserAlreadyexits $error");

      emit(UserErrorState());
    });
  }

  Future<bool> validateUser(
    context,
    String userEmail,
    String userName,
    String userPassword,
  ) async {
    if (userEmail.isEmpty || userPassword.isEmpty || userName.isEmpty) {
      return false;
    } else {
      final entity = UserRegistrationTableCompanion(
        userName: drift.Value(userName),
        userEmail: drift.Value(userEmail),
        userPassword: drift.Value(userPassword),
      );

      getIt<AppDatabase>().usersTableDao.addUser(entity).then((value) {
        log("after recordadd $entity");

        Fluttertoast.showToast(
            msg: "Record Added Successfully",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        //emit(UserInitialState());
        Navigator.pop(context);
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
