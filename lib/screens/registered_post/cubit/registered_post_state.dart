part of 'registered_post_cubit.dart';

@immutable
abstract class RegisteredPostState {}

class RegisteredPostInitialState extends RegisteredPostState {}

class RegisteredPostLoadingState extends RegisteredPostState {}

class RegisteredPostLoadedState extends RegisteredPostState {
  final List<PostTableData> profileList;
  RegisteredPostLoadedState(this.profileList);
}

class RegisteredPostErrorState extends RegisteredPostState {
  final String errorMsg;

  RegisteredPostErrorState(this.errorMsg);
}
