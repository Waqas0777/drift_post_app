import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'cubit/create_post_cubit.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  //final ImagePicker _picker = ImagePicker();
  //File? _image;

  // Uint8List? uInt8ListImage;
  // String myImage = '';
  List<int>? list;
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    // registeredCubit = RegisteredCubit();
    //registeredCubit!.getAllEmployees();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _appDb.close();
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<CreatePostCubit, CreatePostState>(
                    builder: (context, state) {
                      //File? image = context.read<ProfileCubit>().image;
                      if (state is CreatePostInitialState) {
                        log("state $state");
                        return InkWell(
                          onTap: () {
                            _dialogBuilder(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffb8e0d3),
                            ),
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                        );
                      } else if (state is PicLoadingState) {
                        return Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                                child: CircularProgressIndicator()));
                      } else if (state is PicLoadedState) {
                        //log("state $state");
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
                  BlocBuilder<CreatePostCubit, CreatePostState>(
                    builder: (context, state) {
                      final image =
                          BlocProvider.of<CreatePostCubit>(context).image;
                      //context.read<ProfileCubit>().image;
                      return CupertinoButton(
                        color: Colors.blue,
                        onPressed: () {
                          //addEmployee();
                          if (_formKey.currentState!.validate()) {
                            if (image != null) {
                              BlocProvider.of<CreatePostCubit>(context)
                                  .submittedData(
                                      context,
                                      image,
                                      titleController.text.trim(),
                                      descriptionController.text.trim());
                            } else {
                              Fluttertoast.showToast(msg: "Please pick image");
                            }
                          }

                          // else  {
                          //
                          //   Fluttertoast.showToast(
                          //       msg: "Please Upload Pic",
                          //       gravity: ToastGravity.BOTTOM,
                          //       timeInSecForIosWeb: 1,
                          //       backgroundColor: Colors.green,
                          //       textColor: Colors.white,
                          //       fontSize: 16.0);
                          // }
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return UpdateEmployeeScreen();
                          // }));
                        },
                        child: const Text("Add"),
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
                    BlocProvider.of<CreatePostCubit>(context)
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
                      BlocProvider.of<CreatePostCubit>(context)
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
              //fillColor: Colors.green
            ),
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontFamily: "Poppins",
            ),
            // controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Post Title';
              }
              // else if (value.length < 5) {
              //   return "Name should be 5 character long";
              // }
              else {
                return null;
              }
            },
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
                return 'Please enter your Name';
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
}
// (state is PicInitialState)
//     ? const Icon(
//   Icons.add,
// )
//     : (state is PicLoadedState)
//     ? (Image.file(
//   state.image,
//   fit: BoxFit.fitWidth,
// ))
//     : const Icon(
//   Icons.add,
// )
