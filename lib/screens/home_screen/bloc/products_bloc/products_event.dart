part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
  @override
  List<Object?> get props => [];
}

class RetrieveProducts extends ProductsEvent{}

class GiveProductsToState extends ProductsEvent{
  final List<ProductsModel> productsList;
  const GiveProductsToState({required this.productsList});
  @override
  List<Object?> get props => [productsList];
}
class SearchProductsEvent extends ProductsEvent{
  final String search;
  const SearchProductsEvent({required this.search});
}