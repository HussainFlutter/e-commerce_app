import 'package:flutter/material.dart';

import '../../../config_or_core/utils/query/height_width_query.dart';

class LogoAndText extends StatelessWidget {
  const LogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: heightQuery(context, 0.26),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 40,
            left: MediaQuery.of(context).size.width / 2.7,
            child: Image.asset("lib/assets/image_assets/potato_icon.png"),
          ),
          Positioned(
              top: 150,
              left: MediaQuery.of(context).size.width / 3.8,
              child: Text("Your order is complete!",style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),))
        ],
      ),
    );
  }
}
