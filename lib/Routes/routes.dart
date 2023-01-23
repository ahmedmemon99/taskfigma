import 'package:flutter/cupertino.dart';
import 'package:taskappfigma/Screens/Auth%20screen/auth_screen.dart';
import 'package:taskappfigma/Screens/Basket/basket.dart';
import 'package:taskappfigma/Screens/Checkout%20Screen/checkout_screen.dart';
import 'package:taskappfigma/Screens/Home%20Screen/home_screen.dart';
import 'package:taskappfigma/Screens/Splash%20Screen/splash_screen.dart';
import 'package:taskappfigma/Screens/mainScreen/mainScreen.dart';

import '../Screens/Product Details/product_details.dart';

class AppRoutes {

      static Map<String,Widget Function(BuildContext context)> getRoutes(BuildContext context){
          return{
            SplashScreen.routeName : (context) => const SplashScreen(),
            AuthScreen.routeName : (context) => const AuthScreen(),
            HomeScreen.routeName : (context) =>  const Mainscreen(),
            ProductDetails.routeName:(context) => const ProductDetails(),
            Basket.routeName:(context)=>const Basket(),
            CheckOutScreen.routName: (context)=>const CheckOutScreen()


            };
         }

}