
import 'package:e_commerce_app2/config_or_core/models/category_model/category_model.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../config_or_core/models/products_model/products_model.dart';

class CatalogScreen extends StatefulWidget {
  final CategoryModel category;
  const CatalogScreen({super.key,required this.category});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    List<ProductsModel> products = ProductsModel.products.where((element) => element.category == widget.category.name).toList();
    return Scaffold(
      appBar: MyCustomAppBar(title: widget.category.name.toString()),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
            itemCount: products.length,
            itemBuilder: (BuildContext context,int index){
          return ProductCard.catalog(products:products[index]);
            }),
      ),
      bottomNavigationBar: const MyCustomBotNavBar(),
    );
  }
}


