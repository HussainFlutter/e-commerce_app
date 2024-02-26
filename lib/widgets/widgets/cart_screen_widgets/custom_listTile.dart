import 'package:e_commerce_app2/screens/cart_screen/bloc/cart_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config_or_core/models/products_model/products_model.dart';
import '../../../config_or_core/utils/query/height_width_query.dart';

class CustomListTileForWishList extends StatelessWidget {
  final ProductsModel product;
  final  int quantity;
  const CustomListTileForWishList({super.key,required this.product,required this.quantity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: heightQuery(context, 0.01)),
      child: Card(
        elevation: 10,
        child: Row(
          children: [
            Image(
                fit: BoxFit.cover,
                height: heightQuery(context, 0.1),
                width: widthQuery(context, 0.2),
                image:NetworkImage(product.imageUrl,)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(product.name,style: Theme.of(context).textTheme.displaySmall,),
                    Text("\$${product.price.toString()}",style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                IconButton(onPressed: (){
                  context.read<CartScreenBloc>().add(AddProductToCartEvent(product: product));
                }, icon: const Icon(Icons.add_circle_outline)),
                Text(quantity.toString(),style: Theme.of(context).textTheme.headlineMedium),
                IconButton(onPressed: (){
                  context.read<CartScreenBloc>().add(RemoveProductToCartEvent(product: product));
                }, icon: const Icon(Icons.remove_circle_outline_sharp)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
