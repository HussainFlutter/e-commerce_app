import 'package:equatable/equatable.dart';
import '../products_model/products_model.dart';

class WishListModel extends Equatable {
  final List<ProductsModel> products;
  const WishListModel({this.products = const <ProductsModel>[]});
  @override
  List<Object?> get props => [products];
}