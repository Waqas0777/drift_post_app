import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:drift_post_app/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import '../../../main.dart';

part 'registered_post_state.dart';

class RegisteredPostCubit extends Cubit<RegisteredPostState> {
  RegisteredPostCubit() : super(RegisteredPostInitialState());

  PostTableData? postModel;

  late List<PostTableData> postDataList = [];

  void getAllPost() {
    log("calling getAllEmployees");

    try {
      log("calling try");
      emit(RegisteredPostLoadingState());

      getIt<AppDatabase>().postTableDao.getPosts.listen((value) async {
        log("event $value");

        postDataList.clear();
        for (var element in value) {
          postDataList.add(PostTableData(
            postId: element.postId,
            postName: element.postName,
            postDescription: element.postDescription,
            thumbnailImg: element.thumbnailImg,
          ));

          //log("LoadedState");
        }
        emit(RegisteredPostLoadedState(postDataList));
        log("list length=${postDataList.length}");
      });
    } catch (e) {
      log(" error $e");

      emit(RegisteredPostErrorState(e.toString()));
    }
  }

  void showErrorMessage() {
    Fluttertoast.showToast(
        msg: "Record is Already in List",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

// void getAllPost() {
//   log("calling getAllEmployees");
//
//   try {
//     log("calling try");
//     //getIt<AppDatabase>().getProfileList.listen((event) {
//     //getIt<AppAppDatabase>().getProfileWatchSingle.listen((event)
//     emit(RegisteredPostLoadingState());
//
//     getIt<AppDatabase>().postTableDao.getPosts.listen((value) async {
//       log("event $value");
//
//       postDataList.clear();
//       for (var element in value) {
//         //log("elements $element");
//         // profileDataSet.contains(getIt<AppDatabase>().postTableDao.getProfiles.contains(profileModel));
//         // if (await getIt<AppDatabase>().postTableDao.getPosts.contains(postModel) ) {
//         //   return showErrorMessage();
//         // } else {
//
//         postDataList.add(PostTableData(
//           postId: element.postId,
//           postName: element.postName,
//           postDescription: element.postDescription,
//           thumbnailImg: element.thumbnailImg,
//         ));
//
//
//         //log("LoadedState");
//       }
//       emit(RegisteredPostLoadedState(postDataList));
//       log("list length=${postDataList.length}");
//     });
//   } catch (e) {
//     log(" error $e");
//
//     emit(RegisteredPostErrorState(e.toString()));
//   }
// }
