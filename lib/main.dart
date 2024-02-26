import 'package:e_commerce_app2/admin_panel/bloc/add_products_bloc/drop_down_menu_cubit.dart';
import 'package:e_commerce_app2/admin_panel/bloc/watch_confirmed_orders/confirmed_orders_bloc.dart';
import 'package:e_commerce_app2/admin_panel/repo/add_product/add_product_repo_impl.dart';
import 'package:e_commerce_app2/admin_panel/repo/upload_image/upload_image_repo_impl.dart';
import 'package:e_commerce_app2/config_or_core/app_router/appRouter.dart';
import 'package:e_commerce_app2/config_or_core/models/models.dart';
import 'package:e_commerce_app2/repository/category_repository/category_repository_implementation.dart';
import 'package:e_commerce_app2/repository/checkout_repository/checkout_repository_impl.dart';
import 'package:e_commerce_app2/repository/products_repository/products_repository_implementation.dart';
import 'package:e_commerce_app2/repository/wishlist_repository/wishlist_repo_impl.dart';
import 'package:e_commerce_app2/screens/auth/bloc/login_bloc/login_bloc.dart';
import 'package:e_commerce_app2/screens/auth/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:e_commerce_app2/screens/auth/repo/login_repo/login_repo_impl.dart';
import 'package:e_commerce_app2/screens/auth/repo/sign_up_repo/sign_up_repo_impl.dart';
import 'package:e_commerce_app2/screens/cart_screen/bloc/cart_screen_bloc.dart';
import 'package:e_commerce_app2/screens/checkout_screen/bloc/check_out_bloc.dart';
import 'package:e_commerce_app2/screens/home_screen/bloc/category_bloc/category_bloc.dart';
import 'package:e_commerce_app2/screens/home_screen/bloc/products_bloc/products_bloc.dart';
import 'package:e_commerce_app2/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:e_commerce_app2/screens/profile_screen/repo/profile_repo_impl.dart';
import 'package:e_commerce_app2/screens/wishlist_screen/bloc/wish_list_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'admin_panel/bloc/add_products_bloc/add_products_bloc.dart';
import 'admin_panel/bloc/add_products_bloc/check_box2_cubit.dart';
import 'admin_panel/bloc/add_products_bloc/check_box_cubit.dart';
import 'config_or_core/theme/theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsModelAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WishListBloc(WishlistRepoImpl())..add(StartProductWishListEvent()),
        ),
        BlocProvider(
          create: (context) => CartScreenBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc( CategoryRepositoryImplementation())..add(RetrieveCategories()),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(ProductsRepositoryImplementation())..add(RetrieveProducts()),
        ),
        BlocProvider(
          create: (context) => CheckOutBloc(repo:CheckOutRepoImpl(),cartBloc:context.read<CartScreenBloc>())..add(const UpdateCheckOutEvent())
        ),
        BlocProvider(
            create: (context) => AddProductsBloc(repo: UploadImageRepoImpl(),repo2: AddProductToFirestoreRepoImpl())
        ),
        BlocProvider(
            create: (context) => CheckBoxCubit()
        ),
        BlocProvider(
            create: (context) => CheckBox2Cubit()
        ),
        BlocProvider(
            create: (context) => DropDownMenuCubit()
        ),
        BlocProvider(
            create: (context) => ConfirmedOrdersBloc()..add(FetchConfirmedList())
        ),
        BlocProvider(
            create: (context) => SignUpBloc(SignUpRepoImpl())
        ),
        BlocProvider(
            create: (context) => LoginBloc(repo: LoginRepoImpl())
        ),
        BlocProvider(
            create: (context) => ProfileBloc(repo: ProfileRepoImpl())
        ),
      ],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          initialRoute: AppRouter.splashScreen,
          onGenerateRoute: AppRouter.onGenerateRoutes,
        ),
      ),
    );
  }
}
