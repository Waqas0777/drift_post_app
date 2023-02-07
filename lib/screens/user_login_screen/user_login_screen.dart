import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user_registration_screen/user_registration_screen.dart';
import 'cubit/login_cubit.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    userEmailController.dispose();
    userPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Login Screen"),
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
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const UserRegistrationScreen();
                          }));
                        },
                        child: const Text(
                          " Sign Up ",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return CupertinoButton(
                      color: Colors.blue,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).submittedData(
                            context,
                            userEmailController.text.trim(),
                            userPasswordController.text.trim(),
                          );
                          // Navigator.of(context)
                          //     .pushReplacement(MaterialPageRoute(builder: (context) {
                          //   return const MyPostsScreen();
                          // }));
                        }
                        // Navigator.push(context, MaterialPageRoute(builder: (context){
                        //   return UpdateEmployeeScreen();
                        // }));
                      },
                      child: const Text("Login"),
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
              labelText: "Enter User Email",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              fontFamily: "Poppins",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Email';
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
            controller: userPasswordController,
            decoration: InputDecoration(
              labelText: "Enter User Email",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              fontFamily: "Poppins",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Email';
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
