
abstract class ProfileRepo {
  Future<Map<String,dynamic>?> getUser({required String uid});
  Future<void> changeName({required String name, required String uid});
}