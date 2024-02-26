import 'package:e_commerce_app2/config_or_core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashServices()async{
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("uid") == null)
      {
        Navigator.pushNamed(context, AppRouter.loginScreen);
      }
    else
      {
        Navigator.pushNamed(context, AppRouter.homeScreen);
      }
  }
  @override
  void initState() {
    super.initState();
    splashServices();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage("lib/assets/image_assets/potatoLogo.jpg")),
            Text("Potato E-Commerce App",style: Theme.of(context).textTheme.displayMedium,),
          ],
        ),
      ),
    );
  }
}
