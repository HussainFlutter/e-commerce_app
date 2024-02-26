part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}
class FetchProfileEvent extends ProfileEvent {}
class ChangeNameEvent extends ProfileEvent{
  final String name;
  const ChangeNameEvent({required this.name});
  @override
  List<Object?> get props => [name];
}