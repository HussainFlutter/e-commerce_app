import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app2/config_or_core/models/cart_model/cart_model.dart';
import 'package:e_commerce_app2/config_or_core/models/checkout_model/checkout_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../config_or_core/models/products_model/products_model.dart';
import '../../../repository/checkout_repository/checkout_repository_impl.dart';
import '../../cart_screen/bloc/cart_screen_bloc.dart';
part 'check_out_event.dart';
part 'check_out_state.dart';

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  final CheckOutRepoImpl repo;
  StreamSubscription? subscription;
  final CartScreenBloc cartBloc;
  CheckOutBloc({
    required this.repo,required this.cartBloc
  }): super(
    cartBloc.state is CartLoadedState ? CheckOutLoaded(
      products: (cartBloc.state as CartLoadedState).cart.cartModelList,
      subTotal: (cartBloc.state as CartLoadedState).cart.subtotal,
      total: double.parse((cartBloc.state as CartLoadedState).cart.totalPriceString),
      deliveryFee: double.parse((cartBloc.state as CartLoadedState).cart.deliveryFeeString),
    )
        : CheckOutLoading(),
  ) {
    subscription = cartBloc.stream.listen((event) {
      if(state is CartLoadedState)
      {
        add(UpdateCheckOutEvent(model: (state as CartLoadedState).cart));
      }
    });
    on<UpdateCheckOutEvent>((event, emit) => _updateCheckOut(event, emit));
    on<ConfirmCheckoutEvent>((event, emit) => _confirmCheckOut(event, emit));
  }
  _updateCheckOut(
      UpdateCheckOutEvent event,
      Emitter<CheckOutState> emit,
      ){
    if(state is CheckOutLoaded)
      {
        emit(CheckOutLoaded(
           email: event.email ?? (state as CheckOutLoaded).email,
           address: event.address ?? (state as CheckOutLoaded).address,
          products:  (cartBloc.state as CartLoadedState).cart.cartModelList,//event.model?.cartModelList ?? (state as CheckOutLoaded).products,
          subTotal: (cartBloc.state as CartLoadedState).cart.subtotal,//event.model?.subtotal ?? (state as CheckOutLoaded).subTotal,
          deliveryFee:double.parse( (cartBloc.state as CartLoadedState).cart.deliveryFeeString),//event.model?.deliveryFeeString == null ? (state as CheckOutLoaded).deliveryFee : double.parse(event.model!.deliveryFeeString),
          total: double.parse((cartBloc.state as CartLoadedState).cart.totalPriceString),//event.model?.totalPriceString == null ? (state as CheckOutLoaded).total : double.parse(event.model!.totalPriceString),
           zipCode: event.zipCode  ?? (state as CheckOutLoaded).zipCode,
           fullName: event.fullName ?? (state as CheckOutLoaded).fullName,
           city:event.city ?? (state as CheckOutLoaded).city,
           country: event.country ?? (state as CheckOutLoaded).country,
        ));
      }
  }
  _confirmCheckOut(
      ConfirmCheckoutEvent event,
      Emitter<CheckOutState> emit,
      )async{
    subscription?.cancel();
    if(state is CheckOutLoaded)
      {
        try{
          await repo.postDataToFirestore(event.checkOutModel).then((value) {
            emit(CheckOutLoaded(
              email: "",
              fullName: "",
              address: "",
              country: "",
              city: "",
              zipCode: "",
            ));
          });
        }
        catch(e) {
          debugPrint(e.toString());
        }
      }
  }
}
