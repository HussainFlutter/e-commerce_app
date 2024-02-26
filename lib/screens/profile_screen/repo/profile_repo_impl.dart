

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app2/screens/profile_screen/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<Map<String,dynamic>?> getUser({required String uid}) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      var data = await firestore.collection("users").doc(uid).get();
      return data.data();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> changeName({required String name, required String uid}) async {
    try{
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      var data = await firestore.collection("users").doc(uid).update({
      "name" : name,
      });
    }catch(e){
      rethrow;
    }
  }
}