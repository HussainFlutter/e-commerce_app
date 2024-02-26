import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomInkWell({super.key,required this.title,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 160,
        color: Colors.black,
        child: Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            )),
      ),
    );
  }
}
