import 'dart:io';
import 'package:e_commerce_app2/screens/checkout_screen/widgets/applePayButton.dart';
import 'package:e_commerce_app2/screens/checkout_screen/widgets/checkout_bottom_appBar.dart';
import 'package:e_commerce_app2/screens/checkout_screen/widgets/checkout_screen_column2.dart';
import 'package:e_commerce_app2/screens/checkout_screen/widgets/custom_textformfield_for_checkout.dart';
import 'package:e_commerce_app2/screens/checkout_screen/widgets/googlePlayButton.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';
import '../../config_or_core/utils/query/height_width_query.dart';
import 'bloc/check_out_bloc.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    context.read<CheckOutBloc>().add(const UpdateCheckOutEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(
        title: "Check Out",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Column 1 contains Customer Information tile, Delivery Information tile and Select Payment Method
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: heightQuery(context, 0.12),
                      width: widthQuery(context, 0.9),
                      child: BlocBuilder<CheckOutBloc, CheckOutState>(
                        builder: (context, state) {
                          if (state is CheckOutLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is CheckOutLoaded) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CUSTOMER INFORMATION",
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                                CustomTextFormField(
                                  validate: (value){
                                    final RegExp emailRegExp =
                                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                    if(value == null && value == "")
                                    {
                                      return "Enter a Email";
                                    }
                                    else if(!emailRegExp.hasMatch(value!)){
                                      return "Enter a Valid Email";
                                    }
                                     return null;
                                  },
                                  initialValue: state.email,
                                  onChange: (value) {
                                    context
                                        .read<CheckOutBloc>()
                                        .add(UpdateCheckOutEvent(email: value));
                                  },
                                  hintText: "Email",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextFormField(
                                  validate: (value){
                                    if(value == null)
                                    {
                                      return "Enter Full Name";
                                    }
                                    else if(value.length < 4)
                                    {
                                      return "Enter a valid name";
                                    }
                                    return null;
                                  },
                                  initialValue: state.fullName,
                                  onChange: (value) {
                                    context
                                        .read<CheckOutBloc>()
                                        .add(UpdateCheckOutEvent(fullName: value));
                                  },
                                  hintText: "Full Name",
                                ),
                              ],
                            );
                          } else {
                            return const Text("Something went wrong");
                          }
                        },
                      ),
                    ),
                    SizedBox(
                        width: widthQuery(context, 0.9),
                        child: const Divider(
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: heightQuery(context, 0.2),
                      width: widthQuery(context, 0.9),
                      child: BlocBuilder<CheckOutBloc, CheckOutState>(
                        builder: (context, state) {
                          if (state is CheckOutLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is CheckOutLoaded) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DELIVERY INFORMATION",
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextFormField(
                                  validate: (value){
                                    if(value == null)
                                    {
                                      return "Enter Address";
                                    }
                                    else if(value.length < 10)
                                    {
                                      return "Enter a valid address";
                                    }
                                    return null;
                                  },
                                  initialValue: state.address,
                                  onChange: (value) {
                                    context
                                        .read<CheckOutBloc>()
                                        .add(UpdateCheckOutEvent(address: value));
                                  },
                                  hintText: "Address",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextFormField(
                                  validate: (value){
                                    if(value == null)
                                    {
                                      return "Enter City";
                                    }
                                    else if(value.length < 4)
                                    {
                                      return "Enter a valid City";
                                    }
                                    return null;
                                  },
                                  initialValue: state.city,
                                  onChange: (value) {
                                    context
                                        .read<CheckOutBloc>()
                                        .add(UpdateCheckOutEvent(city: value));
                                  },
                                  hintText: "City",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextFormField(
                                  validate: (value){
                                    if(value == null)
                                    {
                                      return "Enter Country";
                                    }
                                    else if(value.length < 4)
                                    {
                                      return "Enter a valid Country";
                                    }
                                    return null;
                                  },
                                  initialValue: state.country,
                                  onChange: (value) {
                                    context
                                        .read<CheckOutBloc>()
                                        .add(UpdateCheckOutEvent(country: value));
                                  },
                                  hintText: "Country",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextFormField(
                                  validate: (value){
                                    if(value == null)
                                    {
                                      return "Enter ZipCode";
                                    }
                                    else if(value.length < 4)
                                    {
                                      return "Enter a valid ZipCode";
                                    }
                                    return null;
                                  },
                                  initialValue: state.zipCode,
                                  onChange: (value) {
                                    context
                                        .read<CheckOutBloc>()
                                        .add(UpdateCheckOutEvent(zipCode: value));
                                  },
                                  hintText: "Zip Code",
                                ),
                              ],
                            );
                          } else {
                            return const Text("Something went wrong");
                          }
                        },
                      ),
                    ),
                    SizedBox(
                        width: widthQuery(context, 0.9),
                        child: const Divider(
                          color: Colors.black,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        color: Colors.grey.withOpacity(0.6),
                        child: ExpansionTile(
                          initiallyExpanded: false,
                          title: const Text("SELECT A PAYMENT METHOD"),
                          children: [
                            Platform.isIOS ? RawApplePayButton(
                              onPressed: () => const PayWithApple(items: [
                                PaymentItem(label: "product name", amount: "1.2"),
                              ],
                              ),
                            )
                                :   RawGooglePayButton(
                              type: GooglePayButtonType.buy,
                              onPressed: (){
                                const PayWithGoogle(items: [
                                  PaymentItem(label: "product name", amount: "1.2"),
                                ]);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Column 2 Contains the Subtotal,Delivery Fee, Total Tile
              const SizedBox(height: 200,),
              const CheckOutColumn2(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CheckOutBotAppBar(formKey: formKey,),
    );
  }
}
