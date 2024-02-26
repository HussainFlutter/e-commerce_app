import 'package:e_commerce_app2/admin_panel/widgets/custom_roundButton.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/watch_confirmed_orders/confirmed_orders_bloc.dart';

class WatchProducts extends StatefulWidget {
  const WatchProducts({super.key});

  @override
  State<WatchProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<WatchProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(
        title: "Confirmed Orders",
      ),
      body: Column(
        children: [
          BlocBuilder<ConfirmedOrdersBloc, ConfirmedOrdersState>(
              builder: (context, state) {
            if (state is ConfirmedOrdersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ConfirmedOrdersLoaded) {
              return Expanded(
                child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Total: ${state.list[index].total}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        "SubTotal: \$${state.list[index].subTotal}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        "DeliveryFee: \$${state.list[index].deliveryFee}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        "Full Name: ${state.list[index].fullName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        "Address: ${state.list[index].address}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        "Country: ${state.list[index].country}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        "City: ${state.list[index].city}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        "ZipCode: ${state.list[index].zipCode}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        "Products: ${state.list[index].products}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomRoundButton(
                                    onTap: () {},
                                    title: "Accept",
                                    width: 0.4,
                                  ),
                                  CustomRoundButton(
                                    onTap: () {},
                                    title: "Decline",
                                    width: 0.4,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return const Text("Something Unexpected happened");
            }
          }),
        ],
      ),
    );
  }
}
