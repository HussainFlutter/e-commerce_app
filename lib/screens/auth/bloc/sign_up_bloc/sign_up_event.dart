part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object?> get props => [];
}

class SignUpWithEmailAndPassword extends SignUpEvent {
  const SignUpWithEmailAndPassword({
        required this.email, required this.password, required this.name});
  final String email;
  final String password;
  final String name;
  @override
  List<Object?> get props => [email, password,name];
}
