import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:e_commerce_app2/config_or_core/models/products_model/products_model.dart';
import 'package:e_commerce_app2/config_or_core/utils/query/height_width_query.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart_screen/bloc/cart_screen_bloc.dart';
import '../wishlist_screen/bloc/wish_list_bloc.dart';

class ProductsScreen extends StatefulWidget {
  final ProductsModel products;
  const ProductsScreen({super.key, required this.products});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        title: widget.products.name,
      ),
      body: ListView(
        children: [
          CarouselSlider(
              items: [
                CategorySliderItems(
                  products: widget.products,
                ),
              ],
              options: CarouselOptions(
                aspectRatio: 1.8,
                viewportFraction: 0.7,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
          NameAndPrice(
              price: widget.products.price, name: widget.products.name),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: MyExpansionTile(
                titleName: "Description",
                description: "Lorem ipsum dolor"
                    " sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
                    " ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud"
                    " exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    " Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu "
                    "fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,"
                    " sunt in culpa qui officia deserunt mollit anim id est laborum."),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: MyExpansionTile(
                titleName: "Order Details",
                description: "Lorem ipsum dolor"
                    " sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
                    " ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud"
                    " exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    " Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu "
                    "fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,"
                    " sunt in culpa qui officia deserunt mollit anim id est laborum."),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              BlocBuilder<WishListBloc, WishListState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        context.read<WishListBloc>().add(
                            AddProductToWishListEvent(
                                product: widget.products));
                        final snackBar = SnackBar(
                            duration: const Duration(milliseconds: 800),
                            backgroundColor: Colors.green,
                            content: Text(
                              "Product added to wishlist",
                              style: Theme.of(context).textTheme.displaySmall,
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ));
                },
              ),
              Container(
                color: Colors.black,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      context.read<CartScreenBloc>().add(AddProductToCartEvent(product: widget.products));
                      final snackBar = SnackBar(
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          content: Row(
                            children: [
                              Text(
                                "Product added to cart",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                               SizedBox(width: widthQuery(context, 0.05),),
                              SizedBox(
                                height: heightQuery(context, 0.04),
                                width: widthQuery(context, 0.36),
                                child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, AppRouter.cartScreen);
                                  }, child: Text("Go To Cart Screen", style: Theme.of(context).textTheme.headlineSmall,),),
                              )
                            ],
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text(
                      "ADD TO CART",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
