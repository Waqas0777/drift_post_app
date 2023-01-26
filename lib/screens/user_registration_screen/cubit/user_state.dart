part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}
class UserSuccessState extends UserState {}
class UserErrorState extends UserState {}
