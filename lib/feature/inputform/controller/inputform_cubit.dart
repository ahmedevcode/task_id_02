import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'inputform_state.dart';

class InputformCubit extends Cubit<InputformState> {
  InputformCubit() : super(InputformInitial());
  changeForm(
      {required String name, required String email, required String phone}) {
    emit(InputformSuccess(name: name, email: email, phone: phone));
  }
}
