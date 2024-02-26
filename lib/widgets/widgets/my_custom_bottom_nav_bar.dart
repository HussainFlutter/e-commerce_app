import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:flutter/material.dart';

class MyCustomBotNavBar extends StatelessWidget {
  const MyCustomBotNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context,AppRouter.homeScreen);
            }, icon: const Icon(Icons.home),color: Colors.white,),
            IconButton(onPressed: (){
              Navigator.pushNamed(context,AppRouter.cartScreen);
            }, icon: const Icon(Icons.shopping_cart,color: Colors.white,)),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, AppRouter.profileScreen);
            }, icon: const Icon(Icons.person,color: Colors.white,)),
          ],
        ),
      ),
    );
  }
}
