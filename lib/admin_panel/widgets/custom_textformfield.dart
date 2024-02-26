import 'package:e_commerce_app2/config_or_core/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboard;
  final String? Function(String?)? validate;
  const CustomTextFormField({super.key,required this.title,required this.controller,required this.validate,this.keyboard = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.headline6,),
        SizedBox(
          height: 40,
          width: widthQuery(context, 0.65),
          child: TextFormField(
            keyboardType: keyboard,
            validator: validate,
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              disabledBorder: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
