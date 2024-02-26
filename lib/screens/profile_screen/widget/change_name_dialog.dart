import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config_or_core/utils/query/height_width_query.dart';
import '../bloc/profile_bloc.dart';

 changeNameDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nameController = TextEditingController();
        final key = GlobalKey<FormState>();
        return AlertDialog(
          content: SizedBox(
            height: heightQuery(context, 0.3),
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Name:",
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Enter a name";
                      } else if (value.length < 3) {
                        return "Name must be 4 letters long";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: heightQuery(context, 0.04),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          )),
                      TextButton(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              context.read<ProfileBloc>().add(ChangeNameEvent(
                                  name: nameController.text.toString()));
                              nameController.dispose();
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
