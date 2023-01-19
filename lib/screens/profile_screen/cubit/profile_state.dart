part of 'profile_cubit.dart';

@immutable
abstract class ProfileState extends Equatable {}

class ProfileInitialState extends ProfileState {
  @override
  // TODO: implement props

  List<Object?> get props => [];
}

// class PicInitialState extends ProfileState{
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
 class PicLoadedState extends ProfileState{

  PicLoadedState(this.image);
  final File image;

  @override
  // TODO: implement props
  List<Object?> get props => [image];
}


class ProfileSuccessState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class PicLoadingState extends ProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
