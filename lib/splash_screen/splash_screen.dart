import 'dart:async';
import 'package:drift_post_app/screens/registered_post/registered_post_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../model/sharedpreferences_model.dart';
import '../screens/registered_users/registered_user_screen.dart';
import '../screens/user_login_screen/user_login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final bool status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() async {
     status = getIt<SharedPreferencesModel>().getLoginStatus();
    Timer(const Duration(seconds: 1), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
    setState(() {});

  }

  void navigateUser() async {
    if (status == true) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return const RegisteredPostScreen();
      }));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return const UserLoginScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/splash.png'),
      ),
    );
  }
}
