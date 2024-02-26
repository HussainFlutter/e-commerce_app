import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app2/config_or_core/models/checkout_model/checkout_model.dart';
import 'package:e_commerce_app2/repository/checkout_repository/checkout_repository.dart';
class CheckOutRepoImpl extends CheckOutRepository{
  final FirebaseFirestore _fb;
  CheckOutRepoImpl({FirebaseFirestore? fb}):
      _fb = fb ?? FirebaseFirestore.instance;
  @override
  Future<void> postDataToFirestore(CheckOutModel model) async {
    await _fb.collection("checkout").add(model.toMap());
  }
  
}