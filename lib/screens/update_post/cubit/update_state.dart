part of 'update_cubit.dart';

@immutable
abstract class UpdateState extends Equatable {}

class UpdateInitialState extends UpdateState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdatePicLoadedState extends UpdateState {
  UpdatePicLoadedState(this.image);
  final File image;
  @override
  // TODO: implement props
  List<Object?> get props => [image];
}

class UpdateSuccessState extends UpdateState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdatePicLoadingState extends UpdateState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
