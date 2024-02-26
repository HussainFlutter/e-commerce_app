part of 'add_products_bloc.dart';

abstract class AddProductsEvent extends Equatable {
  const AddProductsEvent();
  @override
  List<Object?> get props => [];
}

class PickImage extends AddProductsEvent{}
class AddProductToFirestore extends AddProductsEvent{
  ProductsModel productsModel;
  AddProductToFirestore({required this.productsModel});
  @override
  List<Object?> get props => [productsModel];
}