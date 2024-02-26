
import 'package:e_commerce_app2/config_or_core/models/products_model/products_model.dart';
import 'package:e_commerce_app2/repository/wishlist_repository/wishlist_repo.dart';
import 'package:hive/hive.dart';

class WishlistRepoImpl extends WishlistRepo{

  @override
  Future<Box> openBox() async {
    return Hive.openBox<ProductsModel>("wishList");
  }
  
  @override
  Future<void> addToBox(Box box, ProductsModel product) async {
    await box.put(product.id, product);
  }
  @override
  Future<void> removeFromBox(Box box, ProductsModel product) async{
    await box.delete(product.id);
  }
  @override
  Future <List<ProductsModel>> getBox(Box box) async{
     return box.values.toList() as List<ProductsModel>;
  }
  @override
  Future<void> clearBox(Box box) async {
    await box.clear();
  }
  
}