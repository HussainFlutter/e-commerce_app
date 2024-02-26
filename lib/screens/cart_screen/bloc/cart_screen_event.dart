part of 'cart_screen_bloc.dart';

abstract class CartScreenEvent extends Equatable {
  const CartScreenEvent();
  @override
  List<Object?> get props => [];
}

class AddProductToCartEvent extends CartScreenEvent{
  final ProductsModel product;
  const AddProductToCartEvent({required this.product});

  @override
  List<Object?> get props => [product];
}
class RemoveProductToCartEvent extends CartScreenEvent{
  final ProductsModel product;
  const RemoveProductToCartEvent({required this.product});

  @override
  List<Object?> get props => [product];
}
class CheckListEvent extends CartScreenEvent{}
class ResetCartEvent extends CartScreenEvent{}