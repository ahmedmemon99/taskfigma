import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/Screens/Home%20Screen/home_screen.dart';
import 'package:taskappfigma/Screens/menu%20screen/menu_screen.dart';


class Mainscreen extends StatelessWidget {
  const Mainscreen({Key? key}) : super(key: key);

  static const String routeName = '/mainScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sidedDrawerBgColor,
      body: ZoomDrawer(
        mainScreenTapClose: true,
        mainScreen: HomeScreen(),
        menuScreen: const MenuScreen(),
        showShadow: true,
        menuScreenWidth: MediaQuery.of(context).size.width,
        slideWidth: MediaQuery.of(context).size.width * 0.6,
        angle: 0.0,
        borderRadius: 20,
      ),
    );
  }
}
