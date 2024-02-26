
import 'package:e_commerce_app2/config_or_core/models/checkout_model/checkout_model.dart';

abstract class CheckOutRepository {
  Future<void> postDataToFirestore (CheckOutModel model);
}