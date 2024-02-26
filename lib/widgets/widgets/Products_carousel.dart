import 'package:e_commerce_app2/widgets/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../config_or_core/models/products_model/products_model.dart';
import '../../config_or_core/utils/query/height_width_query.dart';

class ProductsCarousel extends StatelessWidget {
 final List<ProductsModel> products;
  const ProductsCarousel({super.key,required this.products});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightQuery(context, 0.23),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (BuildContext context,int index){
            return ProductCard.productScreen(products: products[index]);
          }),
    );
  }
}
