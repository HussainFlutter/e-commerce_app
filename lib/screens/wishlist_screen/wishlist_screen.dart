import 'package:e_commerce_app2/widgets/widgets/my_custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets/product_card.dart';
import 'bloc/wish_list_bloc.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(title: "Wishlist",),
      body: BlocBuilder<WishListBloc, WishListState>(
        builder: (context, state) {
          if(state is WishListLoadingState)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
          if(state is WishListLoadingError)
            {
              return Column(
                children: [
                  Center(child: Text("Error occurred loading data",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.red),)),
                  Center(
                    child: InkWell(
                      onTap: (){
                        context.read<WishListBloc>().add(StartProductWishListEvent());
                      },
                      child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      color: Colors.black,
                      child: Text("Retry",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),),
                    ),),
                  )
                ],
              );
            }
          if(state is WishListLoadedState)
          {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, childAspectRatio: 2),
                      itemCount: state.wishlistProducts.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard.wishList(
                          productCardWidth: 1,
                          left: 0.5,
                          products: state.wishlistProducts.products[index],
                        );
                      }),
                );
          }
          if(state is DeletedItemState)
            {
              return Center(child: Text("Add Some Items To Your Wishlist",style: Theme.of(context).textTheme.displayMedium,));
            }
          else
            {
              return Center(child: Text("An Error Occurred",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.red),));
            }
        },
      ),
    );
  }
}


