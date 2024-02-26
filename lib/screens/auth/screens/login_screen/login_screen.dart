import 'package:e_commerce_app2/admin_panel/widgets/custom_roundButton.dart';
import 'package:e_commerce_app2/admin_panel/widgets/custom_textformfield.dart';
import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:e_commerce_app2/config_or_core/utils/query/height_width_query.dart';
import 'package:e_commerce_app2/screens/auth/bloc/login_bloc/login_bloc.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repo/sign_up_repo/sign_up_repo_impl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(
        title: "Login",
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: heightQuery(context, 0.02),
            ),
            Image.asset("lib/assets/image_assets/potato_icon.png"),
            SizedBox(
              height: heightQuery(context, 0.1),
            ),
            Center(
              child: SizedBox(
                width: widthQuery(context, 0.9),
                child: Column(
                  children: [
                    CustomTextFormField(
                        title: "Email: ",
                        controller: emailController,
                        validate: (value) {}),
                    SizedBox(
                      height: heightQuery(context, 0.01),
                    ),
                    CustomTextFormField(
                        title: "Password: ",
                        controller: passwordController,
                        validate: (value) {}),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouter.signUpScreen);
                            },
                            child: Text(
                              "Sign Up!",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.blue),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: heightQuery(context, 0.05),
                    ),
                    InkWell(
                        onTap: () {
                          SignUpRepoImpl().signUpUsingGoogle().then((value) {
                            Navigator.pushNamed(context, AppRouter.homeScreen);
                          }).onError((error, stackTrace) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text("$error")));
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 40,
                            width: 45,
                            child: Image.asset(
                              "lib/assets/image_assets/google.png",
                              fit: BoxFit.cover,
                            ))),
                    SizedBox(
                      height: heightQuery(context, 0.05),
                    ),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginLoaded) {
                          Navigator.pushNamed(context, AppRouter.homeScreen);
                        }
                        if (state is LoginError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(state.errorMessage)));
                        }
                      },
                      builder: (context, state) {
                        return CustomRoundButton(
                            loading: state.loading,
                            onTap: () {
                              context.read<LoginBloc>().add(LoginInEvent(
                                    email: emailController.text.toString(),
                                    password: passwordController.text.toString(),
                                  ));
                            },
                            title: "Login");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
