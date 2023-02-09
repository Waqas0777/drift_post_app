import 'dart:developer';
import 'dart:typed_data';
import 'package:drift_post_app/database/app_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../main.dart';
import '../../model/sharedpreferences_model.dart';
import 'cubit/update_cubit.dart';

class UpdatePostScreen extends StatefulWidget {
  final int id;

  final PostTableData data;

  // required this.data,
 const UpdatePostScreen({
    required this.id,
    Key? key, required this.data,
  }) : super(key: key);

  @override
  State<UpdatePostScreen> createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends State<UpdatePostScreen> {
  late PostTableData _postTableData;

  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

    Uint8List? bytesImage;

   //final Uint8List bytesImage;

  @override
  void initState() {
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Post"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<UpdateCubit, UpdateState>(
                    builder: (context, state) {
                      if (state is UpdateInitialState) {
                        log("$UpdateInitialState", name: "UpdateInitialState");

                        return InkWell(
                          onTap: () {
                            _dialogBuilder(context);
                          },
                          child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              height: 100,
                              width: 120,
                              child:bytesImage == null? Text("waqas"): Image.memory(
                                bytesImage!,
                                fit: BoxFit.cover,
                              )),
                        );
                      } else if (state is UpdatePicLoadingState) {
                        log("$UpdatePicLoadingState",
                            name: "UpdatePicLoadingState");
                        return Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                                child: CircularProgressIndicator()));
                      } else if (state is UpdatePicLoadedState) {
                        log("$UpdatePicLoadedState",
                            name: "UpdatePicLoadedState");
                        log(state.image.toString(),
                            name: "picloadedstateimage");
                        return InkWell(
                            onTap: () {
                              _dialogBuilder(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.file(
                                state.image,
                                fit: BoxFit.cover,
                              ),
                            ));
                      } else {
                        return Container();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildFormWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<UpdateCubit, UpdateState>(
                    builder: (context, state) {
                      final image = BlocProvider.of<UpdateCubit>(context).image;
                      //context.read<ProfileCubit>().image;
                      return CupertinoButton(
                        color: Colors.blue,
                        onPressed: () {
                          // updatePost();
                          if (_formKey.currentState!.validate()) {
                            if (image != null) {
                              BlocProvider.of<UpdateCubit>(context).updateData(
                                  context,
                                  widget.id,
                                  getIt<SharedPreferencesModel>()
                                      .getLoginEmail()
                                      .toString(),
                                  image,
                                  titleController.text.trim(),
                                  descriptionController.text.trim());
                            } else {
                              Fluttertoast.showToast(msg: "Please pick image");
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please Upload Pic",
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return UpdateEmployeeScreen();
                          // }));
                          Navigator.pop(context);
                        },
                        child: const Text("Update"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    BlocProvider.of<UpdateCubit>(context)
                        .pickImageFromGallery(context);
                  },
                  child: Row(
                    children: const [
                      CircleAvatar(
                        child: Icon(Icons.picture_in_picture_sharp),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Picked Image from Gallery",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () async {
                      // Capture a photo
                      BlocProvider.of<UpdateCubit>(context)
                          .pickImageFromCamera(context);
                    },
                    child: Row(
                      children: const [
                        CircleAvatar(
                          child: Icon(Icons.camera_alt),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Picked Image from Camera",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildFormWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: "Enter Post Title",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
            ),
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontFamily: "Poppins",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Post Title';
              } else {
                return null;
              }
            },
            onChanged: (val) {},
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: "Enter Post Description",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
            ),
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontFamily: "Poppins",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Description';
              }
              // else if (int.parse(value) <= 120) {
              //   return "Age must be less than 121";
              // }
              else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Future<void> getPost() async {

    //_postTableData = await getIt<AppDatabase>().postTableDao.getPost(widget.id);

    // setState(() {
    //   final image =_postTableData.thumbnailImg;
    //   bytesImage = _postTableData.thumbnailImg!;
    //   titleController.text = _postTableData.postName!;
    //   descriptionController.text = _postTableData.postDescription!;
    // });
    bytesImage = widget.data.thumbnailImg;
    titleController.text = widget.data.postName!;
    descriptionController.text = widget.data.postDescription!;
  }
}
