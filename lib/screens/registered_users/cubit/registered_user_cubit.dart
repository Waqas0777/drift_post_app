// import 'dart:developer';
//
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:meta/meta.dart';
//
// import '../../../database/app_database.dart';
// import '../../../main.dart';
//
// part 'registered_user_state.dart';
//
// class RegisteredUserCubit extends Cubit<RegisteredUserState> {
//   RegisteredUserCubit() : super(RegisteredUserInitial());
//   UserRegistrationTableData? usersModel;
//
//   late Set<UserRegistrationTableData> userDataSet = {};
//
//   void getAllUsers() {
//     //log("calling getAllEmployees");
//     emit(RegisteredLoadingState());
//     try {
//       //log("try");
//       //getIt<AppDb>().getEmployeesList.listen((event) {
//       //getIt<AppDb>().getEmployeesWatchSingle.listen((event) {
//
//       //dami comint ko rosto ye uncomint koma
//       // getIt<AppDatabase>().usersTableDao.getUsers.listen((value) async {
//       //   userDataSet.clear();
//       //   for (var element in value) {
//       //
//       //     log("datauser $element");
//       //     // employeeDataSet.contains(getIt<AppDb>().getEmployees.contains(empModel));
//       //     // if (await getIt<AppDb>().getEmployees.contains(empModel) ) {
//       //     //   return showErrorMessage();
//       //     // } else {
//       //
//       //     userDataSet.add(UsersTableData(
//       //       userId: element.userId,
//       //       userEmail: element.userEmail,
//       //       userPassword: element.userPassword,
//       //        ));
//       //
//       //
//       //   }
//       //   // getAllEmployees();
//       //   emit(RegisteredLoadedState(userDataSet));
//       //   log("list length==${userDataSet.length}");
//       //   //log("LoadedState");
//       // });
//     } catch (e) {
//       log(" eeeee $e");
//       emit(RegisteredErrorState(e.toString()));
//     }
//   }
//
//   void showErrorMessage() {
//     Fluttertoast.showToast(
//         msg: "Record is Already in List",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }
// }
