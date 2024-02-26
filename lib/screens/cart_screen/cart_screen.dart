import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:e_commerce_app2/config_or_core/models/models.dart';
import 'package:e_commerce_app2/config_or_core/utils/query/height_width_query.dart';
import 'package:e_commerce_app2/screens/cart_screen/bloc/cart_screen_bloc.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  final ProductsModel? product;
  const CartScreen({this.product, super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartScreenBloc>().add(CheckListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(
        title: "Cart",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: BlocBuilder<CartScreenBloc, CartScreenState>(
              builder: (context, state) {
                if (state is CartLoadedState) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRouter.homeScreen);
                              },
                              child: Text(
                                "Add More Items",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: Colors.white),
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          SingleChildScrollView(
                            child: SizedBox(
                              height: heightQuery(context, 0.6),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.cart
                                      .productQuantity(state.cart.cartModelList)
                                      .keys
                                      .length,
                                  itemBuilder: (context, index) {
                                    return CustomListTileForWishList(
                                        quantity: state.cart
                                            .productQuantity(
                                                state.cart.cartModelList)
                                            .values
                                            .elementAt(index),
                                        product: state.cart
                                            .productQuantity(
                                                state.cart.cartModelList)
                                            .keys
                                            .elementAt(index));
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                                Text(state.cart.subtotalString,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("DELIVERY FEE",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                                Text(state.cart.deliveryFeeString,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium)
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
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder <CartScreenBloc, CartScreenState>(
              builder: (context, state) {
                if(state is CartLoadedState)
                  {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                          if(state.cart.cartModelList.isNotEmpty)
                          {
                            Navigator.pushNamed(context, AppRouter.checkOutScreen);
                          }
                          else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Add Products To Cart")));
                            }
                      },
                      child: Text("CHECKOUT",
                          style: Theme.of(context).textTheme.headline4),
                    );
                  }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
