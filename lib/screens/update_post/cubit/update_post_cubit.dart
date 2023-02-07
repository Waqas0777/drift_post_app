import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_post_state.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInitial());
}
