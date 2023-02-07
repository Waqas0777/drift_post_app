import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../database/app_database.dart';
import '../../../main.dart';
import '../../../model/sharedpreferences_model.dart';
import '../../registered_post/cubit/registered_post_cubit.dart';
import '../../registered_post/registered_post_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  void submittedData(
      BuildContext context, String userEmail, String userPassword) {
    checkUser(context, userEmail, userPassword).then((value) async {
      log("value $value");

      if (value.userEmail == userEmail || value.userPassword == userPassword) {
        emit(LoginSuccessState());
        getIt<SharedPreferencesModel>()
            .setLoginStatus(true); // prefs.setBool("isLoggedIn", true);
        getIt<SharedPreferencesModel>().setLoginEmail(
            userEmail); // prefs.setString("userEmail", userEmail);
        log(userEmail, name: "userEmail");
        BlocProvider.of<RegisteredPostCubit>(context).getAllPost(userEmail);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const RegisteredPostScreen();
        }));
      } else {
        emit(LoginErrorState());
      }
    }).onError((error, stackTrace) {
      emit(LoginErrorState());
    });
  }

  Future<UserRegistrationTableData> checkUser(
    context,
    String userEmail,
    String userPassword,
  ) async {
    // getIt<AppDatabase>()
    //     .usersTableDao
    //     .loginByEmailPassword(userEmail, userPassword);
    return await getIt<AppDatabase>()
        .usersTableDao
        .loginByEmailPassword(userEmail, userPassword);
  }
}
//getIt<SharedPreferencesModel>().getLoginEmail().toString()
