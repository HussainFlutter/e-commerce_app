part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {}
class ProductsLoaded extends ProductsState {
  final List<ProductsModel> productsList;
  const ProductsLoaded({required this.productsList});
  @override
  List<Object> get props => [productsList];
}
class ProductsFilteredState extends ProductsState{
  final List<ProductsModel> list;
  const ProductsFilteredState({required this.list});
  @override
  List<Object> get props => [list];
}

