
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app2/config_or_core/models/models.dart';
import 'package:equatable/equatable.dart';

part 'cart_screen_event.dart';
part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(const CartLoadedState()) {
    on<AddProductToCartEvent>((event, emit) => _addProductToCartList(event, emit));
    on<CheckListEvent>((event,emit) => _checkList());
    on<RemoveProductToCartEvent>((event, emit) => _deleteFromCartList(event, emit));
    on<ResetCartEvent>((event, emit) => _resetCartScreen(emit));
  }
  _checkList()async*{
    yield const CartLoadedState();
  }
  _deleteFromCartList(
      RemoveProductToCartEvent event,
      Emitter<CartScreenState> emit,
      ){
    if(state is CartLoadedState)
    {
      emit(CartLoadedState(cart: CartScreenModel(cartModelList: List.from((state as CartLoadedState).cart.cartModelList)..remove(event.product))));
    }
  }
  _addProductToCartList(
      AddProductToCartEvent event,
      Emitter<CartScreenState> emit,
      )async{
    //yield const CartLoadedState();
    if(state is CartLoadedState)
      {
        emit(CartLoadedState(cart: CartScreenModel(cartModelList: List.from((state as CartLoadedState).cart.cartModelList)..add(event.product))));
      }
  }
  _resetCartScreen(
      Emitter<CartScreenState> emit,
      ){
    if(state is CartLoadedState)
    {
      emit(CartLoadedState(cart: CartScreenModel(cartModelList: List.from((state as CartLoadedState).cart.cartModelList)..clear())));
    }
  }
}
