import 'package:bloc/bloc.dart';
import 'package:e_commerce_app2/screens/auth/repo/sign_up_repo/sign_up_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpRepoImpl repo;
  SignUpBloc(this.repo) : super(SignUpInitial(loading: false)) {
    on<SignUpWithEmailAndPassword>(
        (event, emit) => _signUpWithEmailAndPass(event, emit));
  }
  _signUpWithEmailAndPass(
    SignUpWithEmailAndPassword event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading(loading: true));
    try {
      await repo.signUpUsingEmailAndPass(
        event.email,
        event.password,
        event.name,
      );
     emit(SignUpLoaded(loading: false));
    } catch (e) {
      emit(SignUpError(errorMessage: e.toString(),loading: false));
    }
  }
}
