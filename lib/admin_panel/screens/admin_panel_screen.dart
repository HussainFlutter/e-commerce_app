import 'package:e_commerce_app2/admin_panel/bloc/watch_confirmed_orders/confirmed_orders_bloc.dart';
import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_inkwell.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(
        title: "Admin Panel",
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomInkWell(title: "Add Products", onTap: (){
              Navigator.pushNamed(context, AppRouter.addProducts);
            }),
            const SizedBox(
              height: 10,
            ),
            CustomInkWell(title: "Watch Orders", onTap: (){
              context.read<ConfirmedOrdersBloc>().add(FetchConfirmedList());
              Navigator.pushNamed(context, AppRouter.watchOrders);
            },)
          ],
        ),
      ),
    );
  }
}
