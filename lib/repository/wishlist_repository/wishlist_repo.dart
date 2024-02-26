
import 'package:e_commerce_app2/config_or_core/models/models.dart';
import 'package:hive/hive.dart';

abstract class WishlistRepo {
  Future<Box> openBox ();
  Future<void> addToBox (Box box, ProductsModel product);
  Future<void> removeFromBox (Box box, ProductsModel product);
  Future<void> clearBox(Box box);
  Future<List<ProductsModel>> getBox(Box box);
}