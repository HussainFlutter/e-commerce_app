

import 'package:e_commerce_app2/screens/auth/repo/login_repo/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<void> loginIntoAccount (String email, String password) async {
    try{
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value) async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("uid", value.user!.uid);
      });
    }catch(e){
      rethrow;
    }
  }
}