import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //final ImagePicker _picker = ImagePicker();
  //File? _image;

  // Uint8List? uInt8ListImage;
  // String myImage = '';
  List<int>? list;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    // registeredCubit = RegisteredCubit();
    //registeredCubit!.getAllEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ProfileCubit(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        //File? image = context.read<ProfileCubit>().image;
                        if (state is ProfileInitialState) {
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
                        }
                        // else if (state is PicLoadingState) {
                        //   return const CircularProgressIndicator();
                        // }
                        else if (state is PicLoadedState) {
                          return InkWell(
                            onTap: () {
                              // showDialog();
                              // log("showDialog ++ "+ showDialog().toString());
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
                                  fit: BoxFit.fitWidth,
                                )),
                          );
                        }
                        else {
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
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        final image = context.read<ProfileCubit>().image;
                        return CupertinoButton(
                          color: Colors.blue,
                          onPressed: () {
                            //addEmployee();

                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<ProfileCubit>(context)
                                  .submittedData(
                                context,
                                image!,
                                nameController.text.trim(),
                                ageController.text.trim(),
                                phoneController.text.trim(),
                              );
                            }
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
                    BlocProvider.of<ProfileCubit>(context)
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
                      BlocProvider.of<ProfileCubit>(context)
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
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Enter User Age",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontFamily: "Poppins",
            ),
            // controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your age';
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
            controller: ageController,
            decoration: InputDecoration(
              labelText: "Enter Your Name",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
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
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
              labelText: "Enter Your Phone Number",
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Phone Number';
              } else if (value.length < 5) {
                return "Password must be 5 character long";
              } else {
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
