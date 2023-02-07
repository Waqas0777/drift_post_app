part of 'registered_post_cubit.dart';

@immutable
abstract class RegisteredPostState {}

class RegisteredPostInitialState extends RegisteredPostState {}

class RegisteredPostLoadingState extends RegisteredPostState {}

class RegisteredPostLoadedState extends RegisteredPostState {
  final List<PostTableData> postList;

  RegisteredPostLoadedState(this.postList);
}

class RegisteredPostErrorState extends RegisteredPostState {
  final String errorMsg;

  RegisteredPostErrorState(this.errorMsg);
}
