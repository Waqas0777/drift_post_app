import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/user_cubit.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Screen"),
      ),
      body: SafeArea(
          child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    buildFormWidget(),
                    const SizedBox(height: 20,),
                    CupertinoButton(
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
                          BlocProvider.of<UserCubit>(context)
                              .submittedData(
                            context,
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }
                        // Navigator.push(context, MaterialPageRoute(builder: (context){
                        //   return UpdateEmployeeScreen();
                        // }));
                      },
                      child: const Text("Add"),
                    ),


                  ],
                ),
              ),
            ),
          )

      ),
    );
  }

  Widget buildFormWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
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
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Enter Your Password",
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
                return 'Please enter your Password';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }


}
