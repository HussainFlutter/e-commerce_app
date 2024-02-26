part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  bool loading;
  LoginState({required this.loading});
  @override
  List<Object> get props => [loading];
}

class LoginInitial extends LoginState {
  LoginInitial({required super.loading});
}

class LoginLoading extends LoginState {
  LoginLoading({required super.loading});
}
class LoginLoaded extends LoginState {
  LoginLoaded({required super.loading});
}
class LoginError extends LoginState {
  final String errorMessage;
  LoginError({required this.errorMessage, required super.loading});
  @override
  List<Object> get props => [errorMessage];
}
