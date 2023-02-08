import 'package:drift_post_app/screens/create_post/cubit/create_post_cubit.dart';
import 'package:drift_post_app/screens/registered_post/cubit/registered_post_cubit.dart';
import 'package:drift_post_app/screens/registered_post/registered_post_screen.dart';
import 'package:drift_post_app/screens/registered_users/cubit/registered_user_cubit.dart';
import 'package:drift_post_app/screens/update_post/cubit/update_cubit.dart';
import 'package:drift_post_app/screens/user_login_screen/cubit/login_cubit.dart';
import 'package:drift_post_app/screens/user_registration_screen/cubit/user_cubit.dart';
import 'package:drift_post_app/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database/app_database.dart';
import 'model/sharedpreferences_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  runApp(const MyApp());
}

Future<void> initDependencyInjection() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<AppDatabase>(AppDatabase());
  // getIt.registerSingleton<RegisteredPostCubit>(RegisteredPostCubit());
  getIt.registerSingleton<SharedPreferencesModel>(
      SharedPreferencesModel(sharedPreferences));

  // getIt.registerSingleton<UsersTableDao>(UsersTableDao());
}

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (BuildContext context) => UserCubit()),
        // BlocProvider<RegisteredUserCubit>(create:(BuildContext context)=>RegisteredUserCubit()..getAllUsers()),
        BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit()),
        BlocProvider<RegisteredPostCubit>(
            create: (BuildContext context) => RegisteredPostCubit()),
        BlocProvider<CreatePostCubit>(
            create: (BuildContext context) => CreatePostCubit()),
        BlocProvider<UpdateCubit>(
            create: (BuildContext context) => UpdateCubit()),
        // BlocProvider<RegisteredProfileCubit>(create:(BuildContext context)=>RegisteredProfileCubit()..getAllProfiles()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
