import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config_or_core/utils/query/height_width_query.dart';
import '../../cart_screen/bloc/cart_screen_bloc.dart';

class TopPartOfScreen extends StatelessWidget {
  const TopPartOfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hi,Hussain Ali",style:Theme.of(context).textTheme.headline3,),
        const SizedBox(height: 5,),
        Text("Thank you for ordering on \n"
            " Potato Bazaar",style: Theme.of(context).textTheme.headline6,),
        const SizedBox(height: 10,),
        Text("ORDER CODE: #k321-akd2",style: Theme.of(context).textTheme.headline3,),
        const SizedBox(height: 40,),
        BlocBuilder<CartScreenBloc, CartScreenState>(
          builder: (context, state) {
            if (state is CartLoadedState) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("SUBTOTAL",
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text(state.cart.subtotalString,
                          style: Theme.of(context).textTheme.headlineMedium),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("DELIVERY FEE",
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text(state.cart.deliveryFeeString,
                          style: Theme.of(context).textTheme.headlineMedium)
                    ],
                  ),
                  SizedBox(
                    height: heightQuery(context, 0.006),
                  ),
                  Container(
                    height: heightQuery(context, 0.05),
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("TOTAL",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.white)),
                        Text(state.cart.totalPriceString,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
        const SizedBox(height: 20,),
        Text("ORDER DETAILS",style: Theme.of(context).textTheme.headline3,),
      ],
    );
  }
}
