part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}
class ProfileLoaded extends ProfileState {
  final Map<String,dynamic>? data;
  const ProfileLoaded({required this.data});
  @override
  List<Object> get props => [data!];
}
class ProfileError extends ProfileState {
  final String errorMessage;
  const ProfileError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
