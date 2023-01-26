// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../user_registration_screen/user_registration_screen.dart';
// import 'cubit/registered_user_cubit.dart';
//
// class RegisteredUserScreen extends StatefulWidget {
//   const RegisteredUserScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RegisteredUserScreen> createState() => _RegisteredUserScreenState();
// }
//
// class _RegisteredUserScreenState extends State<RegisteredUserScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Registered Users"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return const UserRegistrationScreen();
//               }));
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//           child: BlocProvider(
//         create: (context) => RegisteredUserCubit(), //..getAllUsers()
//         child: BlocConsumer<RegisteredUserCubit, RegisteredUserState>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             if (state is RegisteredUserInitial) {
//               return const Center(
//                 child: Text("No data added yet"),
//               );
//             } else if (state is RegisteredLoadingState) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is RegisteredErrorState) {
//               return const Center(
//                 child: Text("Error Loading data"),
//               );
//             } else if (state is RegisteredLoadedState) {
//               return ListView.builder(
//                   itemCount: state.userList.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     var listData = state.userList.elementAt(index);
//                     //log(state.empList.toString());
//
//                     return Card(
//                       shape: const RoundedRectangleBorder(
//                         side: BorderSide(
//                           color: Colors.green,
//                           style: BorderStyle.solid,
//                           width: 1.2,
//                         ),
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(16),
//                             bottomRight: Radius.circular(16)),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               flex: 1,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   // Text(employee.id.toString()),
//                                   Row(
//                                     children: [
//                                       const Text("User Email : "),
//                                       Text(listData.userEmail.toString()),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       const Text("User Password : "),
//                                       Text(listData.userPassword.toString()),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                     //   (state.empList.isEmpty)
//                     //     ? const Center(
//                     //   child: Text("No Data Exist"),
//                     // ):
//                   });
//             } else {
//               return const Center(
//                 child: Text("Something went wrong!!!"),
//               );
//             }
//           },
//         ),
//       )),
//     );
//   }
// }
