import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:drift_post_app/database/app_database.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import '../../../main.dart';
import 'package:flutter/cupertino.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitialState());
  final ImagePicker _picker = ImagePicker();
  File? image;
  String myImage = '';

  void updateData(BuildContext context,int id, String email, File image,
      String postTitle, String postDescription) {
    // emit(RegistrationLoadingState());
    validatePost(context, id, email, image, postTitle, postDescription)
        .then((value) async {
      if (value) {
        log("Updated $value");
        emit(UpdateInitialState());
        Fluttertoast.showToast(
            msg: "Updated : $value",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        // log("Failedshu $value");
      }
    }).onError((error, stackTrace) {
      //emit(RegistrationErrorState());
      log("FailedHog ya $error");
      Fluttertoast.showToast(
          msg: "Error : $error",
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  Future<bool> validatePost(context,int id, String email, File image, String postTitle,
      String postDescription) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    if (image.path.isEmpty || postTitle.isEmpty || postDescription.isEmpty) {
      log("failed");

      return Future.value(false);
    } else {
      final post = PostTableCompanion(
          postId: drift.Value(id),
          postName: drift.Value(postTitle),
          postDescription: drift.Value(postDescription),
          userEmail: drift.Value(email),
          thumbnailImg: drift.Value(File(image.path).readAsBytesSync()));
      // if()
      getIt<AppDatabase>().postTableDao.updatePost(post).then((value) {
        //  log("profilePic $value");
        Fluttertoast.showToast(
            msg: "Post Update Successfully",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        // emit(ProfileInitialState());

      });

      return Future.value(true);
      Navigator.pop(context);
    }
  }

  Future<void> pickImageFromGallery(context) async {
    // Pick an imag\
    emit(UpdatePicLoadingState());
    PickedFile? pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    // prefs?.setString("image", image!.path.toString());
    if (pickedFile != null) {
      image = File(pickedFile.path);
      convertToBase64(image!);
      log("_image $image");

      // log("$UpdatePicLoadingState", name: "UpdatePicLoadingState");
      emit(UpdatePicLoadedState(image!));
      Navigator.pop(context);
    }

    // log("$UpdatePicLoadedState", name: "updatePicLoadedState");
  }

  void pickImageFromCamera(context) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);
      convertToBase64(image!);
      //emit(PicLoadedState(image!));
      Navigator.pop(context);

      emit(UpdatePicLoadingState());
      Future.delayed(const Duration(seconds: 1), () {
        // Do something
        emit(UpdatePicLoadedState(image!));
      });
    }
  }

  String convertToBase64(File image) {
    List<int> imageBytes = image.readAsBytesSync();

    String base64image = base64Encode(imageBytes);
    // base64image = "data:image?png;base64,$base64image";
    // print('THis image i will save $base64image');
    myImage = base64Encode(imageBytes);
    //emit(PicLoadedState(image));

    return base64image;
  }
}
