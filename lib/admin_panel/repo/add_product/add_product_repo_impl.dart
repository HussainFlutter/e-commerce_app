import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app2/config_or_core/models/products_model/products_model.dart';
import 'add_product_repo.dart';

class AddProductToFirestoreRepoImpl extends AddProductToFirestoreRepo{
  @override
  Future<void> addProduct(ProductsModel product) async{
    FirebaseFirestore firestore =  FirebaseFirestore.instance;
    Map <String,dynamic> products = product.toMap();
    await firestore.collection("products").add(products);
  }
}