import 'package:e_commerce_app2/admin_panel/screens/add_product_screen.dart';
import 'package:e_commerce_app2/admin_panel/screens/admin_panel_screen.dart';
import 'package:e_commerce_app2/admin_panel/screens/watch_orders_screen.dart';
import 'package:e_commerce_app2/config_or_core/models/products_model/products_model.dart';
import 'package:e_commerce_app2/screens/checkout_screen/checkout_screen.dart';
import 'package:e_commerce_app2/screens/profile_screen/profile_screen.dart';
import 'package:e_commerce_app2/screens/screens.dart';
import 'package:flutter/material.dart';
import '../../screens/auth/screens/login_screen/login_screen.dart';
import '../../screens/auth/screens/sign_up_screen/sign_up_screen.dart';
import '../models/category_model/category_model.dart';

class AppRouter {
  static const String homeScreen = "/";
  static const String cartScreen = "CartScreen";
  static const String catalogScreen = "CatalogScreen";
  static const String wishlistScreen = "WishListScreen";
  static const String splashScreen = "SplashScreen";
  static const String productsScreen = "ProductsScreen";
  static const String checkOutScreen = "CheckOutScreen";
  static const String orderConfirmationScreen = "OrderConfirmationScreen";
  static const String loginScreen = "LoginScreen";
  static const String signUpScreen = "SignUpScreen";
  static const String profileScreen = "ProfileScreen";
  //Admin Panel
  static const String adminPanel = "AdminPanel";
  static const String addProducts = "AddProducts";
  static const String watchOrders = "WatchOrders";
  //Admin Panel
  static Route<dynamic> onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      //Admin Panel
      case adminPanel:
        return MaterialPageRoute(builder: (context)=> const AdminPanel());
      case addProducts:
        return MaterialPageRoute(builder: (context)=> const AddProducts());
      case watchOrders:
        return MaterialPageRoute(builder: (context)=> const WatchProducts());
    //Admin Panel
      case profileScreen:
        return MaterialPageRoute(builder: (context)=> const ProfileScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (context)=> const LoginScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (context)=> const SignUpScreen());
      case orderConfirmationScreen:
        return MaterialPageRoute(builder: (context)=> const OrderConfirmation());
      case checkOutScreen:
        return MaterialPageRoute(builder: (context)=> const CheckOutScreen());
      case splashScreen:
        return MaterialPageRoute(builder: (context)=> const SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context)=> const HomeScreen());
      case cartScreen:
        return MaterialPageRoute(builder: (context)=> const CartScreen());
      case catalogScreen:
        return MaterialPageRoute(builder: (context)=>  CatalogScreen(category: settings.arguments as CategoryModel));
      case wishlistScreen:
      return MaterialPageRoute(builder: (context)=> const WishListScreen());
      case productsScreen:
        return MaterialPageRoute(builder: (context)=>  ProductsScreen(products: settings.arguments as ProductsModel,));
      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Error No Route Found"),
            ),
            body: const Center(
              child: Text("Error No Route Found",style: TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontFamily: "Avenir",
                  fontWeight: FontWeight.bold,
              ),),
            ),
          );
        });
    }
  }
}