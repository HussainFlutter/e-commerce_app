import 'package:e_commerce_app2/admin_panel/widgets/custom_roundButton.dart';
import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:e_commerce_app2/screens/order_confirmation/widgets/Logo_and_text.dart';
import 'package:e_commerce_app2/screens/order_confirmation/widgets/top_part_of_screen.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart_screen/bloc/cart_screen_bloc.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  void dispose() {
    context.read<CartScreenBloc>().add(ResetCartEvent());
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyCustomAppBar(title: "Order Confirmation",),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Contains Image and the "Your order complete!" text.
            const LogoAndText(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: CustomRoundButton(onTap: (){
                    Navigator.pushNamed(context, AppRouter.homeScreen);
                  }, title: "Go to Home")),
                  //Contains Name of customer,thank you message,Order code, price and Order details
                  const TopPartOfScreen(),
                  SizedBox(
                    height: 300,
                    child: BlocBuilder<CartScreenBloc, CartScreenState>(
                      builder: (context, state) {
                        if(state is CartLoadedState)
                          {
                            state.cart.productQuantity(state.cart.cartModelList);
                            return ListView.builder(
                                itemCount: state.cart.productQuantity(state.cart.cartModelList).keys.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ProductCard.orderConfirmation(
                                        products: state.cart.productQuantity(state.cart.cartModelList).keys.elementAt(index),
                                      quantity: state.cart.productQuantity(state.cart.cartModelList).values.elementAt(index).toString(),
                                    ),
                                  );
                                });
                          }
                        else
                          {
                            return const Text("Something Went Wrong");
                          }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
