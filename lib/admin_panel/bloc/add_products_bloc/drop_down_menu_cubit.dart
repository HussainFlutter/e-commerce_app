import 'package:bloc/bloc.dart';
part 'drop_down_menu_state.dart';

class DropDownMenuCubit extends Cubit<String> {
  DropDownMenuCubit() : super("");
  void whenSelect(String current){
    emit(current);
  }
}
