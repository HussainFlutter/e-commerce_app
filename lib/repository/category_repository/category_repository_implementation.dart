import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app2/config_or_core/models/category_model/category_model.dart';
import 'package:e_commerce_app2/repository/category_repository/category_repository.dart';
class CategoryRepositoryImplementation extends CategoryRepository{
  final FirebaseFirestore _fs;
  CategoryRepositoryImplementation({FirebaseFirestore? fs}):
      _fs = fs ?? FirebaseFirestore.instance;
  @override
  Stream<List<CategoryModel>> getAllCategories() {
    return _fs.collection("categories").snapshots().map((event) {
      return event.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
    });
  }

}