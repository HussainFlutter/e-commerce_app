import 'package:e_commerce_app2/config_or_core/models/auth_models/Auth_model.dart';
abstract class AddUserToFireStoreRepo{
  Future<void> addUserToFireStore(AuthModel information,String uid);
}