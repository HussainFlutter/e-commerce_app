import 'package:flutter/material.dart';
import '../../config_or_core/utils/query/height_width_query.dart';
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: widthQuery(context, 0.02)),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          )),
    );
  }
}
