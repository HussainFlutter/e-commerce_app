import 'package:e_commerce_app2/config_or_core/utils/query/height_width_query.dart';
import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double width;
  final bool loading;
  const CustomRoundButton({
    super.key,
    this.loading = false,
    required this.onTap,
    required this.title,
    this.width = 0.49,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: heightQuery(context, 0.05),
        width:  widthQuery(context,width),
        color: Colors.black,
        child: Center(child: loading == true ? const Center(child: CircularProgressIndicator(color: Colors.white,),) :Text(title,style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),)),
      ),
    );
  }
}
