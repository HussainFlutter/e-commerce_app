import 'package:e_commerce_app2/config_or_core/models/products_model/products_model.dart';
import 'package:flutter/material.dart';
import '../../config_or_core/app_router/appRouter.dart';
import '../../config_or_core/models/category_model/category_model.dart';
import '../../config_or_core/utils/query/height_width_query.dart';

class CategorySliderItems extends StatelessWidget {
  final CategoryModel? category;
  final ProductsModel? products;
   const CategorySliderItems({
     super.key,
     this.category,
     this.products,
   });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(products == null)
          {
            Navigator.pushNamed(context, AppRouter.catalogScreen,arguments: category);
          }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Builder(builder: (context) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Image.network(
                  products == null ? category!.image : products!.imageUrl,
                  fit: BoxFit.cover,
                  width: heightQuery(context, 0.8),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: heightQuery(context, 0.02)),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ])),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        products == null ? category!.name : "",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white),
                      )),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}