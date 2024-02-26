import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:e_commerce_app2/config_or_core/models/products_model/products_model.dart';
import 'package:e_commerce_app2/screens/cart_screen/bloc/cart_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config_or_core/utils/query/height_width_query.dart';
import '../../screens/wishlist_screen/bloc/wish_list_bloc.dart';

class ProductCard extends StatelessWidget {
  final ProductsModel products;
  final double productCardWidth;
  final bool wishlist;
  final double left;
  final bool orderConfirmation;
  final String quantity;
  final bool cart;
  final bool productScreen;
  final bool homeScreen;
  final bool catalogScreen;
  const ProductCard.homeScreen({
    super.key,
    this.quantity = "0",
    required this.products,
    this.left = 0,
    this.productCardWidth = 0.423,
    this.cart = false,
    this.productScreen = false,
    this.wishlist = false,
    this.orderConfirmation = false,
    this.homeScreen = true,
    this.catalogScreen = false,
  });
  const ProductCard.productScreen({
    super.key,
    this.quantity = "0",
    required this.products,
    this.left = 0,
    this.productCardWidth = 0.423,
    this.cart = false,
    this.productScreen = true,
    this.wishlist = false,
    this.orderConfirmation = false,
    this.homeScreen = false,
    this.catalogScreen = false,
  });
  const ProductCard.cart(
      {
      super.key,
      required this.products,
      this.productCardWidth = 0.423,
      this.left = 0,
      this.quantity = "0",
        this.cart = true,
        this.productScreen = false,
        this.wishlist = false,
        this.orderConfirmation = false,
        this.homeScreen = false,
        this.catalogScreen = false,
      });
  const ProductCard.orderConfirmation({
    super.key,
    this.quantity = "0",
    required this.products,
    this.left = 0,
    this.productCardWidth = 0.423,
    this.cart = false,
    this.productScreen = false,
    this.wishlist = false,
    this.orderConfirmation = true,
    this.homeScreen = false,
    this.catalogScreen = false,
  });
  const ProductCard.wishList({
    super.key,
    this.quantity = "0",
    required this.products,
    this.left = 0,
    this.productCardWidth = 0.423,
    this.cart = false,
    this.productScreen = false,
    this.wishlist = true,
    this.orderConfirmation = false,
    this.homeScreen = false,
    this.catalogScreen = false,
  });
  const ProductCard.catalog({
    super.key,
    this.quantity = "0",
    required this.products,
    this.left = 0,
    this.productCardWidth = 0.423,
    this.cart = false,
    this.productScreen = false,
    this.wishlist = false,
    this.orderConfirmation = false,
    this.homeScreen = false,
    this.catalogScreen = true,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRouter.productsScreen,
              arguments: products);
        },
        child: Stack(
          children: [
            SizedBox(
              height: heightQuery(context, 0.23),
              width: widthQuery(context, productCardWidth),
              child: Image.network(
                products.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 65,
              left: widthQuery(context, left),
              child: Container(
                height: heightQuery(context, 0.1),
                width: widthQuery(context, 0.423),
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Positioned(
              top: 70,
              left: widthQuery(context, left),
              child: Container(
                height: heightQuery(context, 0.09),
                width: widthQuery(context, 0.423),
                color: Colors.black.withOpacity(0.6),
                child: Container(
                  margin: const EdgeInsets.only(left: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            products.category,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "\$${products.price.toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      orderConfirmation == true
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  quantity,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 120, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    wishlist == true
                        ? IconButton(
                            onPressed: () {
                              context.read<WishListBloc>().add(
                                  DeleteProductToWishListEvent(
                                      product: products));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(),
                    IconButton(
                      onPressed: () {
                        context
                            .read<CartScreenBloc>()
                            .add(AddProductToCartEvent(product: products));
                      },
                      icon: const Icon(
                        Icons.add_circle_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
