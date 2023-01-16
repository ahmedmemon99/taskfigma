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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.sidedDrawerBgColor,
      body: ZoomDrawer(
        mainScreenScale: 0.41,
        mainScreenTapClose: true,
        mainScreen: const HomeScreen(),
        menuScreen: const MenuScreen(),
        showShadow: true,
        menuScreenWidth: MediaQuery.of(context).size.width,
        slideWidth: MediaQuery.of(context).size.width * 0.61,
        angle: 0.0,
        borderRadius: 20,
      ),
    );
  }
}
