import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  bool tick;
  Function (bool?)? onChange;
  CustomCheckBox({super.key, required this.title,this.tick = false,required this.onChange});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: Theme.of(context).textTheme.headline6,),
        Checkbox(
          fillColor: MaterialStateColor.resolveWith((states) =>Colors.black),
          checkColor: Colors.white,
            value: tick,
            onChanged: onChange,
        ),
      ],
    );
  }
}

