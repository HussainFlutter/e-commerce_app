import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config_or_core/utils/query/height_width_query.dart';
import '../../cart_screen/bloc/cart_screen_bloc.dart';

class CheckOutColumn2 extends StatelessWidget {
  const CheckOutColumn2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ORDER SUMMARY:",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10,),
        Container(
          height: heightQuery(context, 0.12),
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              )),
          child: BlocBuilder<CartScreenBloc, CartScreenState>(
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
        ),
      ],
    );
  }
}
