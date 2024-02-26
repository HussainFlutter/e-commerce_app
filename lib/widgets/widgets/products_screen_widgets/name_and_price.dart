import 'package:flutter/material.dart';

import '../../../config_or_core/utils/query/height_width_query.dart';

class NameAndPrice extends StatelessWidget {
  final String name;
  final double price;
  const NameAndPrice({
    required this.price,
    required this.name,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: widthQuery(context, 0.1),vertical:heightQuery(context, 0.02) ),
      child: Stack(
        children: [
          Container(
            height: heightQuery(context, 0.05),
            width: widthQuery(context, 0.8),
            color: Colors.black,
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),),
                  Text("\$${price.toString()}",style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
