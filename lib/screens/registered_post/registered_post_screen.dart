import 'dart:developer';
import 'dart:typed_data';
import 'package:drift_post_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../database/app_database.dart';
import '../../model/sharedpreferences_model.dart';
import '../create_post/create_post_screen.dart';
import '../update_post/update_post_screen.dart';
import '../user_login_screen/user_login_screen.dart';
import 'cubit/registered_post_cubit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisteredPostScreen extends StatefulWidget {
  const RegisteredPostScreen({Key? key}) : super(key: key);

  @override
  State<RegisteredPostScreen> createState() => _RegisteredPostScreenState();
}

class _RegisteredPostScreenState extends State<RegisteredPostScreen> {
  String emaill = getIt<SharedPreferencesModel>().getLoginEmail().toString();

  @override
  void initState() {
    // TODO: implement initState

    // context.read()<RegisteredPostCubit>().getAllPost();
    //getPost();

    super.initState();
  }

  // void getPost() {
  //   BlocProvider.of<RegisteredPostCubit>(context).getAllPost();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Posts"),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CreatePostScreen();
                }));
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Show Snack bar',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return logout();
                    });
              },
            ),
          ],
        ),
        body: SafeArea(
            child: BlocProvider(
                create: (context) => RegisteredPostCubit()..getAllPost(emaill),
                child: BlocConsumer<RegisteredPostCubit, RegisteredPostState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return BlocBuilder<RegisteredPostCubit,
                        RegisteredPostState>(
                      builder: (context, state) {
                        if (state is RegisteredPostInitialState) {
                          return const Center(
                            child: Text("No data added yet"),
                          );
                        } else if (state is RegisteredPostLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is RegisteredPostErrorState) {
                          return const Center(
                            child: Text(
                              "Error Loading data!!!",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        } else if (state is RegisteredPostLoadedState) {
                          log("List Length ${state.postList.length}");

                          return ListView.builder(
                              itemCount: state.postList.length,
                              itemBuilder: (BuildContext context, int index) {
                                var listData = state.postList.elementAt(index);
                                Uint8List? bytesImage;
                                bytesImage = listData.thumbnailImg;

                                return Card(
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.green,
                                      style: BorderStyle.solid,
                                      width: 1.2,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // Text(employee.id.toString()),
                                              Row(
                                                children: [
                                                  const Text("Post Title : "),
                                                  Text(listData.postName
                                                      .toString()),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("User Email : "),
                                                  Text(listData.userEmail
                                                      .toString()),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                      "Post Description : "),
                                                  Text(listData.postDescription
                                                      .toString()),
                                                ],
                                              ),

                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                25)),
                                                  ),
                                                  height: 100,
                                                  width: 120,
                                                  child: Image.memory(
                                                    bytesImage!,
                                                    fit: BoxFit.cover,
                                                  )),

                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                            //data: listData,
                                                            return UpdatePostScreen(
                                                              data:listData,
                                                      id: listData.postId,
                                                    );
                                                  }));
                                                },
                                                child: const Icon(
                                                  Icons.edit,
                                                  color: Colors.green,
                                                )),
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  dialogShow(listData.postId);
                                                  //deleteEmployee(empData[index].id);
                                                },
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                                //   (state.empList.isEmpty)
                                //     ? const Center(
                                //   child: Text("No Data Exist"),
                                // ):
                              });
                        } else {
                          return const Center(
                            child: Text("Something went wrong!!!"),
                          );
                        }
                      },
                    );
                  },
                ))),
      ),
    );
  }

  void dialogShow(int id) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              //this right here
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Are You Sure You Want to Delete??",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              getIt<AppDatabase>()
                                  .postTableDao
                                  .deletePost(id)
                                  .then((value) => Fluttertoast.showToast(
                                      msg: "Post deleted Successfully",
                                      backgroundColor: Colors.red,
                                      gravity: ToastGravity.BOTTOM));
                              // setState(() {});
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.red,
                              ),
                              child: const Center(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.green,
                              ),
                              child: const Center(
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget logout() {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Are You Sure You Want to logout??",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      getIt<SharedPreferencesModel>().setLoginStatus(
                          false); // prefs.setBool("isLoggedIn", true);
                      //getIt<SharedPreferencesModel>().setLoginEmail("");
                      getIt<SharedPreferencesModel>().removeEmail();
                      getIt<SharedPreferencesModel>().prefs.clear();
                      // BlocProvider.of<RegisteredPostCubit>(context).c
                      Navigator.pop(context);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const UserLoginScreen();
                      }));
                      //exit(0);
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text(
                          "Yes",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Text(
                          "No",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
