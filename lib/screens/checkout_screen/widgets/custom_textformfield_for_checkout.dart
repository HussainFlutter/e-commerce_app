import 'package:flutter/material.dart';
import '../../../config_or_core/utils/query/height_width_query.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String) onChange;
  final String? Function(String?)? validate;
   String? initialValue = "";
   CustomTextFormField({super.key,required this.hintText,required this.onChange,required this.initialValue,required this.validate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hintText,style: Theme.of(context).textTheme.titleLarge,),
        SizedBox(
          height: heightQuery(context, 0.036),
          width: widthQuery(context, 0.7),
          child: TextFormField(
            validator: validate,
            initialValue: initialValue,
            onChanged: onChange,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              disabledBorder:OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
