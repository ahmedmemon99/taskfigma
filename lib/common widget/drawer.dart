import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../Screens/menu screen/menu_screen.dart';


class CustomDrawer extends StatelessWidget {
   CustomDrawer({Key? key}) : super(key: key);


   final ZoomDrawerController _controller =ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
              controller: _controller,
              menuScreen: const MenuScreen(),
              mainScreen: this,
              borderRadius: 24.0,
              showShadow: true,
              angle: 0.0,
              menuScreenWidth: MediaQuery.of(context).size.width,
              drawerShadowsBackgroundColor: Colors.grey.shade300,
               slideWidth: MediaQuery.of(context).size.width * 0.62 ,
        );

  }
}
