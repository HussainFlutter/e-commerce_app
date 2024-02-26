import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app2/config_or_core/models/auth_models/Auth_model.dart';
import 'add_user_to_firebase_repo.dart';

class AddUserToFireStoreRepoImpl extends AddUserToFireStoreRepo{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addUserToFireStore(AuthModel information,String uid) async{
    await firestore.collection("users").doc(uid).set(information.toMap());
  }
}