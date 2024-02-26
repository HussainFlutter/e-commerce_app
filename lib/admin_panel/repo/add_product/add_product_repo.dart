import 'package:e_commerce_app2/config_or_core/models/models.dart';

abstract class AddProductToFirestoreRepo{
  Future<void> addProduct(ProductsModel product);
}