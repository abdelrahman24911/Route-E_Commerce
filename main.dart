import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj2/Screens/ProductsTab/Cart/Cubit/cart_cubit.dart';
import 'package:proj2/Screens/ProductsTab/Cart/Cubit/get_cart_cubit.dart';
import 'package:proj2/Screens/ProductsTab/Cart/cart_screen.dart';
import 'package:proj2/Screens/ProductsTab/Cubit/products_cubit.dart';
import 'package:proj2/Screens/ProductsTab/product_details/product_details_screen.dart';
import 'package:proj2/Screens/WishListTab/Cubit/get_user_wishlist.dart';
import 'package:proj2/Screens/WishListTab/Cubit/wishlist_cubit.dart';
import 'package:proj2/home/home_screen.dart';
import 'package:proj2/login/login.dart';
import 'package:proj2/register/register.dart';
import 'package:proj2/widgetss/shared_preference_utils.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();        
    await SharedPreferenceUtils.init();               
  String route;
  var token = SharedPreferenceUtils.getData(key: 'token');
  if(token == null){
    route = HomeScreen.routeName;
  }
  else{
    route = HomeScreen.routeName;
  }
  runApp(
      MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>CartCubit()),
        BlocProvider(create:(context)=>GetCartCubit()),
        BlocProvider(create:(context)=>WishListCubit()),
        BlocProvider(create:(context)=>GetUserWishListCubit()),
        BlocProvider(create: (context)=>ProductsCubit())
      ],
      child: MyApp(route:route)));
}
class MyApp extends StatelessWidget {
  String route;
  MyApp({super.key, required this.route});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      initialRoute:route,
      routes:{Login.routeName:(context)=>Login(),
        Register.routeName:(context)=>Register(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        ProductDetailsScreen.routeName:(context)=>ProductDetailsScreen(),
        CartScreen.routeName:(context)=>CartScreen(),
      },
    );
  }
}
