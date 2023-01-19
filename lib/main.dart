import 'package:drift_post_app/screens/profile_screen/cubit/profile_cubit.dart';
import 'package:drift_post_app/screens/profile_screen/profile_screen.dart';
import 'package:drift_post_app/screens/user_screen/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'database/app_database.dart';

void main() async {
  runApp(const MyApp());
  await initDependencyInjection();
}


Future<void> initDependencyInjection() async {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
}

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create:(BuildContext context)=>UserCubit()),
        BlocProvider<ProfileCubit>(create:(BuildContext context)=>ProfileCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const ProfileScreen(),
      ),
    );
  }
}
