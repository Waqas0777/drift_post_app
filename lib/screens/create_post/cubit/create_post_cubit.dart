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
import '../../registered_post/cubit/registered_post_cubit.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitialState());
  final ImagePicker _picker = ImagePicker();
  File? image;
  String myImage = '';

  void submittedData(BuildContext context, File image, String postTitle,
      String postDescription) {
    // emit(RegistrationLoadingState());
    validateProfile(context, image, postTitle, postDescription)
        .then((value) async {
      if (value) {
        log("Added $value");
        emit(CreatePostInitialState());
        // Fluttertoast.showToast(
        //     msg: "Added : $value",
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.green,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
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

  Future<bool> validateProfile(
      context, File image, String postTitle, String postDescription) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    if (image.path.isEmpty || postTitle.isEmpty || postDescription.isEmpty) {
      log("failed");

      return Future.value(false);
    } else {
      final post = PostTableCompanion(
          postName: drift.Value(postTitle),
          postDescription: drift.Value(postDescription),
          thumbnailImg: drift.Value(File(image.path).readAsBytesSync()));
      // if()
      getIt<AppDatabase>().postTableDao.addUserProfile(post).then((value) {
      //  log("profilePic $value");
        Fluttertoast.showToast(
            msg: "Post Added Successfully",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        // emit(ProfileInitialState());
        Navigator.pop(context);
      });

      return Future.value(true);
    }
  }

  Future<void> pickImageFromGallery(context) async {
    //log("ProfileInitialState $ProfileInitialState");
    // Pick an image
    PickedFile? pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    // prefs?.setString("image", image!.path.toString());
    if (pickedFile != null) {
      image = File(pickedFile.path);
      convertToBase64(image!);
      log("_image $image");
      //log("pickedFile $pickedFile");

      // prefs?.setString("image", convertToBase64(_image!));
      //print("was"+convertToBase64(_image!));
      emit(PicLoadingState());
      Future.delayed(const Duration(milliseconds: 800), () {
        // Do something
        emit(PicLoadedState(image!));
      });
      //log("PicLoadedState $PicLoadedState");
    }

    Navigator.pop(context);
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

      emit(PicLoadingState());
      Future.delayed(const Duration(seconds: 1), () {
        // Do something
        emit(PicLoadedState(image!));
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

// if (value) {
// log("Successfully added $value");
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
