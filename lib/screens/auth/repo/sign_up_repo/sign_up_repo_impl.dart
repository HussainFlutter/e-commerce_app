import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app2/config_or_core/models/auth_models/Auth_model.dart';
import 'package:e_commerce_app2/screens/auth/repo/add_user_to_firestore/add_user_to_firestore_repo_impl.dart';
import 'package:e_commerce_app2/screens/auth/repo/sign_up_repo/sign_up_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpRepoImpl extends SignUpRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AddUserToFireStoreRepoImpl repo = AddUserToFireStoreRepoImpl();
  @override
  Future<void> signUpUsingEmailAndPass(
      String email, String password, String name) async {
    try {
      UserCredential value = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await repo.addUserToFireStore(
          AuthModel(
          email: email,
          password: password,
          name: name,
          tokenid: value.user!.uid
          ),
          value.user!.uid
      );
    } catch (error) {
      debugPrint("SignUpRepoImpl error: $error");
      rethrow;
    }
  }

  @override
  Future<void> signUpUsingGoogle() async{
    try{
      // will pop up the screen to sign in
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      // obtain the details from request
      final GoogleSignInAuthentication gAuth =  await gUser!.authentication;
      // create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      //finally sign in
      final UserCredential information = await _auth.signInWithCredential(credential);
      //Checking if the users already exists if not we will add him to firebase
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      var instance = await firestore.collection("users").doc(information.user!.uid).get();
      if(instance.exists)
        {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("uid", information.user!.uid);
        }
      else
        {
          await repo.addUserToFireStore(
              AuthModel(
                email: information.user!.email!,
                password: "",
                name: information.user!.displayName!,
                tokenid: information.user!.uid,
              ),
              information.user!.uid
          );
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("uid", information.user!.uid);
        }
      //Checking if the users already exists if not we will add him to firebase
    }
    catch(e){
      rethrow;
    }
  }
}
