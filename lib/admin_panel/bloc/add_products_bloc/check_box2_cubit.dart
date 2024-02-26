import 'package:bloc/bloc.dart';

part 'check_box2_state.dart';

class CheckBox2Cubit extends Cubit<bool> {
  CheckBox2Cubit() : super(false);
  void toggleCheckBox(){
  emit(!state);
  }
}
