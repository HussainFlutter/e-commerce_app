import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app2/config_or_core/models/products_model/products_model.dart';
import 'package:e_commerce_app2/repository/products_repository/products_repository.dart';
class ProductsRepositoryImplementation extends ProductsRepository{
  final FirebaseFirestore _fs;
  ProductsRepositoryImplementation({FirebaseFirestore? fs}):
      _fs = fs ?? FirebaseFirestore.instance;

  @override
  Stream<List<ProductsModel>> getAllProducts() {
    return _fs.collection("products").snapshots().map((event){
      return event.docs.map((e) => ProductsModel.fromSnapshot(e)).toList();
    });
  }

}