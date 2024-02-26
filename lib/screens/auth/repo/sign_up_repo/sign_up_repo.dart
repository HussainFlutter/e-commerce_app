

abstract class SignUpRepo {
  Future<void> signUpUsingEmailAndPass(String email,String password,String name);
  Future<void> signUpUsingGoogle();
}