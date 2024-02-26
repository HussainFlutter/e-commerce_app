import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repo/profile_repo_impl.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepoImpl repo;
  ProfileBloc({required this.repo}) : super(ProfileInitial()) {
    on<FetchProfileEvent>((event, emit) => _fetchProfile(emit));
    on<ChangeNameEvent>((event, emit) => _changeName(event));
  }
  _fetchProfile(
      Emitter<ProfileState> emit,
      )async{
    emit(ProfileLoading());
    try{
      final SharedPreferences pref = await SharedPreferences.getInstance();
      String? uid = pref.getString("uid");
      var data = await repo.getUser(uid: uid!);
      emit(ProfileLoaded(data: data));
    }catch(e){
      emit(ProfileError(errorMessage: e.toString()));
    }
  }
  _changeName(
      ChangeNameEvent event,
      )async{
    try{
      final SharedPreferences pref = await SharedPreferences.getInstance();
      String? uid = pref.getString("uid");
      await repo.changeName(name: event.name, uid: uid!);
      var data = await repo.getUser(uid: uid);
      emit(ProfileLoaded(data: data));
    }
    catch(e){
      debugPrint("Profile Bloc Change User Function Error : $e");
    }
  }
}
