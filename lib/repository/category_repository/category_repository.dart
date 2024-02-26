import '../../config_or_core/models/category_model/category_model.dart';
abstract class CategoryRepository {
  Stream <List<CategoryModel>> getAllCategories();
}