part of 'wish_list_bloc.dart';

abstract class WishListEvent extends Equatable {
  const WishListEvent();
  @override
  List<Object?> get props => [];
}

class AddProductToWishListEvent extends WishListEvent {
  final ProductsModel product;
  const AddProductToWishListEvent({required this.product});
  @override
  List<Object?> get props => [product];
}

class DeleteProductToWishListEvent extends WishListEvent {
  final ProductsModel product;
  const DeleteProductToWishListEvent({required this.product});
  @override
  List<Object?> get props => [product];
}

class StartProductWishListEvent extends WishListEvent {}
