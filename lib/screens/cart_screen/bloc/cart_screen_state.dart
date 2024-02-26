part of 'cart_screen_bloc.dart';

abstract class CartScreenState extends Equatable {
  const CartScreenState();
  @override
  List<Object> get props => [];
}

class CartScreenInitial extends CartScreenState {}

class CartLoadingState extends CartScreenState{}
class CartLoadedState extends CartScreenState{
  final CartScreenModel cart;
  const CartLoadedState({this.cart = const CartScreenModel()});
  @override
  List<Object> get props => [cart];
}
class CartLoadingErrorState extends CartScreenState{}

class SubTotalCalculatedState extends CartScreenState{
  final double subTotal;
  const SubTotalCalculatedState({required this.subTotal});
}
