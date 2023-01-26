import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user_login_screen/user_login_screen.dart';
import 'cubit/user_cubit.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    userEmailController.dispose();
    userPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Screen"),
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
                buildFormWidget(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                        onTap: () {
                          //Navigator.of(context).pushNamed("/login");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return const UserLoginScreen();
                              }));
                        },
                        child: const Text(
                          " Login ",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return CupertinoButton(
                      color: Colors.blue,
                      onPressed: () {
                        // Fluttertoast.showToast(
                        //     msg: "Button Clicked",
                        //     gravity: ToastGravity.BOTTOM,
                        //     timeInSecForIosWeb: 1,
                        //     backgroundColor: Colors.green,
                        //     textColor: Colors.white,
                        //     fontSize: 16.0);
                        //addUser();
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<UserCubit>(context).submittedData(
                            context,
                            userNameController.text.trim(),
                            userEmailController.text.trim(),
                            userPasswordController.text.trim(),
                          );
                        }
                        // Navigator.push(context, MaterialPageRoute(builder: (context){
                        //   return UpdateEmployeeScreen();
                        // }));
                      },
                      child: const Text("Register User"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget buildFormWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: userEmailController,
            decoration: InputDecoration(
              labelText: "Enter User Name",
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
                return 'Please enter your Name';
              }
              // else if(!EmailValidator.validate(value)){
              //   return "Please Enter Valid Email";
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
            controller: userNameController,
            decoration: InputDecoration(
              labelText: "Enter Your Email",
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
                return 'Please enter your Email';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: userPasswordController,
            decoration: InputDecoration(
              labelText: "Enter User Password",
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
                return 'Please enter your Password';
              }
              // else if(!EmailValidator.validate(value)){
              //   return "Please Enter Valid Email";
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
