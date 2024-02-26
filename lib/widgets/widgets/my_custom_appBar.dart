import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool wishList;
  final bool back;
  const MyCustomAppBar({
    super.key,
    this.wishList = false,
    this.back = true,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: back,
      centerTitle: true,
      elevation: 0,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        color: Colors.black,child: Text(title,style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),)),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        wishList == true ?IconButton(onPressed: (){
          Navigator.pushNamed(context, AppRouter.wishlistScreen);
        }, icon: const Icon(Icons.favorite))
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}