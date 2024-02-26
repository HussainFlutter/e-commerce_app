import 'package:bloc/bloc.dart';

part 'check_box_state.dart';

class CheckBoxCubit extends Cubit<bool> {
  CheckBoxCubit() : super(false);
  void toggleCheckBox(){
    emit(!state);
  }
}

