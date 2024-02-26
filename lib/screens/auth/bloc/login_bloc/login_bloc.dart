import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repo/login_repo/login_repo_impl.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepoImpl repo;
  LoginBloc({required this.repo}) : super(LoginInitial(loading: false)) {
    on<LoginInEvent>((event, emit) => _login(event, emit));
  }
  _login(
      LoginInEvent event,
      Emitter<LoginState> emit,
      )async{
    emit(LoginLoading(loading: true));
    try{
      await repo.loginIntoAccount(event.email, event.password);
      emit(LoginLoaded(loading: false));
    }catch(e){
      emit(LoginError(errorMessage: e.toString(),loading: false));
    }
  }
}
