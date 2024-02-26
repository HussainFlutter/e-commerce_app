import 'dart:io';
import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:e_commerce_app2/config_or_core/models/checkout_model/checkout_model.dart';
import 'package:e_commerce_app2/screens/checkout_screen/bloc/check_out_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../../config_or_core/utils/query/height_width_query.dart';

class CheckOutBotAppBar extends StatelessWidget {
  GlobalKey<FormState> formKey;
   CheckOutBotAppBar({super.key,required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: heightQuery(context, 0.07),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CheckOutBloc, CheckOutState>(
              builder: (context, state) {
                if (state is CheckOutLoaded) {
                  if (Platform.isAndroid) {
                   return RawGooglePayButton(
                      onPressed: () {
                        if(formKey.currentState!.validate())
                        {
                          try{
                            // print(state.products);
                            // print(state.total);
                            // print(state.subTotal);
                            // print(state.deliveryFee);
                            context.read<CheckOutBloc>().add(ConfirmCheckoutEvent(
                                checkOutModel:
                                CheckOutModel(
                                    products: state.products,
                                    email: state.email,
                                    address: state.address,
                                    city: state.city,
                                    country: state.country,
                                    fullName: state.fullName,
                                    zipCode: state.zipCode,
                                    deliveryFee: state.deliveryFee,
                                    total: state.total,
                                    subTotal: state.subTotal,
                                )));
                            context.read<CheckOutBloc>().add(UpdateCheckOutEvent(email: "haha"));
                            print(state.products);
                            print(state.total);
                            print(state.subTotal);
                            print(state.deliveryFee);
                            // Navigator.pushNamed(
                            //     context, AppRouter.orderConfirmationScreen);
                          }catch(e){
                            debugPrint("CHECKOUT-MODEL ERROR:$e");
                          }
                        }
                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fill the Forms")));
                        }
                      },
                    );
                  }
                  if (Platform.isIOS) {
                    return RawApplePayButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRouter.orderConfirmationScreen);
                      },
                    );
                  }
                }
                if (state is CheckOutLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Text("Something went wrong");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
