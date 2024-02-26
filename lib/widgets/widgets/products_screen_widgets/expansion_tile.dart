import 'package:flutter/material.dart';

class MyExpansionTile extends StatelessWidget {
  final String titleName;
  final String description;
  const MyExpansionTile({super.key,required this.titleName,required this.description});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(
          titleName,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        children: [
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ]);
  }
}
