import 'dart:io';
import 'package:e_commerce_app2/admin_panel/bloc/add_products_bloc/drop_down_menu_cubit.dart';
import 'package:e_commerce_app2/admin_panel/widgets/custom_checkbox.dart';
import 'package:e_commerce_app2/admin_panel/widgets/custom_roundButton.dart';
import 'package:e_commerce_app2/admin_panel/widgets/custom_textformfield.dart';
import 'package:e_commerce_app2/config_or_core/models/models.dart';
import 'package:e_commerce_app2/config_or_core/utils/query/height_width_query.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/add_products_bloc/add_products_bloc.dart';
import '../bloc/add_products_bloc/check_box2_cubit.dart';
import '../bloc/add_products_bloc/check_box_cubit.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  static const List<String> category = ["Smoothies", "Soft Drink", "Water"];
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String imagePath = "";
  bool isPopular = false;
  bool isRecommended = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String categorySelect = category[0];
    return Scaffold(
      appBar: const MyCustomAppBar(
        title: "Add Products",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: heightQuery(context, 0.7),
                    width: widthQuery(context, 0.8),
                    child: Column(
                      children: [
                        //Image BlockBuilder
                        CustomRoundButton(
                            onTap: () {
                              context.read<AddProductsBloc>().add(PickImage());
                            },
                            title: "Add Image"),
                        SizedBox(height: heightQuery(context, 0.02),),
                        BlocConsumer<AddProductsBloc, AddProductsState>(
                          builder: (context, state) {
                            if (state is UploadingImageLoading) {
                              return const CircularProgressIndicator.adaptive();
                            }
                            if (state is UploadingImageLoaded) {
                              imagePath = state.imagePath;
                              return Image.network(
                                  state.imagePath,
                                width: widthQuery(context, 0.7),
                                height: heightQuery(context, 0.2),
                              );
                            }
                            return Text("Pick image",style: Theme.of(context).textTheme.headline4,);
                          },
                          listener:
                              (BuildContext context, AddProductsState state) {
                            if (state is UploadingImageError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: const Duration(seconds: 1),
                                      backgroundColor:
                                          Colors.black.withOpacity(0.8),
                                      content: const Center(
                                          child: Text("Pick a Image"))));
                            }
                          },
                        ),
                        //Image BlockBuilder
                        SizedBox(
                          height: heightQuery(context, 0.01),
                        ),
                        CustomTextFormField(
                          controller: nameController,
                          title: "Name",
                          validate: (value) {
                            if (value == null) {
                              return "Enter a Name";
                            } else if (value.length <= 3) {
                              return "Enter a Valid Name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: heightQuery(context, 0.01),
                        ),
                        CustomTextFormField(
                          controller: priceController,
                          title: "Price",
                          keyboard: TextInputType.number,
                          validate: (value) {
                            if (value == null) {
                              return "Enter a Price";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: heightQuery(context, 0.01),
                        ),
                        BlocBuilder<DropDownMenuCubit, String>(
                          builder: (context, state) {
                            return DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                isExpanded: true,
                                value: categorySelect,
                                items: category.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (current) {
                                  context.read<DropDownMenuCubit>().whenSelect(current!);
                                  categorySelect = current;
                                });
                          },
                        ),
                        SizedBox(
                          height: heightQuery(context, 0.01),
                        ),
                        BlocBuilder<CheckBoxCubit, bool>(
                          builder: (context, state) {
                            return CustomCheckBox(
                              tick: state,
                              onChange: (value) {
                                context.read<CheckBoxCubit>().toggleCheckBox();
                                isPopular = state;
                                value = state;
                              },
                              title: "isPopular",
                            );
                          },
                        ),
                        SizedBox(
                          height: heightQuery(context, 0.01),
                        ),
                        BlocBuilder<CheckBox2Cubit, bool>(
                          builder: (context, state) {
                            return CustomCheckBox(
                              tick: state,
                              onChange: (value) {
                                context.read<CheckBox2Cubit>().toggleCheckBox();
                                isRecommended = state;
                                value = state;
                              },
                              title: "isRecommended",
                            );
                          },
                        ),
                        SizedBox(
                          height: heightQuery(context, 0.01),
                        ),
                        CustomRoundButton(
                            onTap: () {
                              var uuid = DateTime.now().millisecondsSinceEpoch;
                              ();
                              if (_formKey.currentState!.validate() &&
                                  imagePath != '') {
                                context
                                    .read<AddProductsBloc>()
                                    .add(AddProductToFirestore(
                                        productsModel: ProductsModel(
                                      id: uuid,
                                      name: nameController.text.toString(),
                                      category: categorySelect,
                                      imageUrl: imagePath,
                                      price: double.parse(
                                          priceController.text.toString()),
                                      isRecommended: isRecommended,
                                      isPopular: isPopular,
                                    )));
                              }
                            },
                            title: "Add Product"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
