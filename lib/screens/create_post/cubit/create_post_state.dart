part of 'create_post_cubit.dart';

@immutable
abstract class CreatePostState extends Equatable {}

class CreatePostInitialState extends CreatePostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PicLoadedState extends CreatePostState {
  PicLoadedState(this.image);
  final File image;
  @override
  // TODO: implement props
  List<Object?> get props => [image];
}

class CreatePostSuccessState extends CreatePostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PicLoadingState extends CreatePostState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
