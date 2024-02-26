import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app2/config_or_core/utils/query/height_width_query.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/category_bloc/category_bloc.dart';
import 'bloc/products_bloc/products_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(
        back: false,
        wishList: true,
        title: "Potato Bazaar",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: searchController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Search",
                  ),
                  onChanged: (value){
                    context.read<ProductsBloc>().add(SearchProductsEvent(search: value.toString()));
                  },
                ),
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadimg) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                      items: state.categoriesList.map((products) {
                        return CategorySliderItems(
                          category: products,
                        );
                      }).toList(),
                      options: CarouselOptions(
                        aspectRatio: 1.4,
                        viewportFraction: 0.8,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ));
                } else {
                  return Text(
                    "Something Went Wrong",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.red),
                  );
                }
              },
            ),
            const SectionTitle(title: "RECOMMENDED"),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductsLoaded) {
                  return ProductsCarousel(
                      products: state.productsList
                          .where((product) => product.isRecommended)
                          .toList());
                }
                if(state is ProductsFilteredState)
                {
                  return ProductsCarousel(
                      products: state.list
                          .where((product) => product.isRecommended)
                          .toList());
                }
                else {
                  return Text(
                    "Something Went Wrong",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.red),
                  );
                }
              },
            ),
            const SectionTitle(title: "Most Popular"),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductsLoaded) {
                  return ProductsCarousel(
                      products: state.productsList
                          .where((product) => product.isPopular)
                          .toList());
                }
                else {
                  return Text(
                    "Something Went Wrong",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.red),
                  );
                }
              },
            ),
            const SectionTitle(title: "Products"),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductsLoaded) {
                  return SizedBox(
                    height: heightQuery(context, 0.5),
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1),
                        itemCount: state.productsList.length,
                        itemBuilder: (context, index){
                           return ProductCard.homeScreen(products: state.productsList[index]);
                        }),
                  );

                }
                else {
                  return Text(
                    "Something Went Wrong",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.red),
                  );
                }
              },
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyCustomBotNavBar(),
    );
  }
}
