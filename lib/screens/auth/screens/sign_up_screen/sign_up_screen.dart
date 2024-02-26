import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:e_commerce_app2/screens/auth/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../admin_panel/widgets/custom_roundButton.dart';
import '../../../../admin_panel/widgets/custom_textformfield.dart';
import '../../../../config_or_core/utils/query/height_width_query.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  bool loading = false;
  final _key = GlobalKey<FormState>();
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(
        title: "Sign Up",
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: widthQuery(context, 0.1),
                      vertical: heightQuery(context, 0.015)),
                  color: Colors.black,
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white),
                  )),
              SizedBox(
                height: heightQuery(context, 0.02),
              ),
              Image.asset("lib/assets/image_assets/potato_icon.png"),
              SizedBox(
                height: heightQuery(context, 0.05),
              ),
              Center(
                child: SizedBox(
                  width: widthQuery(context, 0.9),
                  child: Column(
                    children: [
                      CustomTextFormField(
                          title: "Name: ",
                          controller: nameController,
                          validate: (value) {
                            if (value == null) {
                              return "Enter a Name";
                            } else if (value.length < 3) {
                              return "Name must be at least 4 letters long";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: heightQuery(context, 0.01),
                      ),
                      CustomTextFormField(
                          title: "Email: ",
                          controller: emailController,
                          validate: (value) {
                            final RegExp emailRegExp = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                            if (value == null && value == "") {
                              return "Enter a Email";
                            } else if (!emailRegExp.hasMatch(value!)) {
                              return "Enter a Valid Email";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: heightQuery(context, 0.01),
                      ),
                      CustomTextFormField(
                          title: "Password: ",
                          controller: passwordController,
                          validate: (value) {
                            if (value == null) {
                              return "Enter a Password";
                            } else if (value.length < 8) {
                              return "Password must be 8 letters long";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: heightQuery(context, 0.01),
                      ),
                      CustomTextFormField(
                          title: "Confirm Pass: ",
                          controller: confirmPassController,
                          validate: (value) {
                            if (value == null) {
                              return "Enter a Password";
                            } else if (value !=
                                passwordController.text.toString()) {
                              return "Passwords don't match";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: heightQuery(context, 0.05),
                      ),
                      BlocConsumer<SignUpBloc, SignUpState>(
                        listener: (context, state) {
                          if (state is SignUpLoaded) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                    content:
                                        Text("User Created Successfully")));
                            Navigator.pushNamed(context, AppRouter.loginScreen);
                          }
                          if(state is SignUpError)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.red,
                                      content:
                                      Text(state.errorMessage)));
                            }
                        },
                        builder: (context, state) {
                          return CustomRoundButton(
                              loading: state.loading,
                              onTap: () {
                                if (_key.currentState!.validate()) {
                                  context
                                      .read<SignUpBloc>()
                                      .add(SignUpWithEmailAndPassword(
                                        email: emailController.text.toString(),
                                        password:
                                            passwordController.text.toString(),
                                        name: nameController.text.toString(),
                                      ));
                                }
                              },
                              title: "Sign Up");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
