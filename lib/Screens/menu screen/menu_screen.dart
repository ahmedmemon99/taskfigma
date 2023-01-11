import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'menu_item.dart' as menuitem;
import 'dart:math' as math;



class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight =MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top - MediaQuery.of(context).viewPadding.bottom;
    final deviceWidth =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(deviceHeight * 0.1735),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(),
            margin: const EdgeInsets.only(right: 50),
            alignment: Alignment.topRight,
            //color: Colors.red,
            child:SvgPicture.asset(AppCustomIcons.menuScreenCircle)
          ),
          SizedBox(height: deviceHeight * 0.02,),
          Container(
            decoration: const BoxDecoration(),
            margin: const EdgeInsets.only(right: 20),
            alignment: Alignment.topRight,
            //color: Colors.red,
            child:  CircleAvatar(backgroundColor: AppColors.authHeaderSmallOutCircleColor,radius: deviceHeight * 0.025,
              child: CircleAvatar(backgroundColor: AppColors.splashScreenButtonColor,radius:deviceHeight * 0.014,),
              ),),
        ],
      ),),
      backgroundColor: AppColors.sidedDrawerBgColor,
      body: Container(
        padding: EdgeInsets.only(left: deviceWidth * 0.111,bottom: deviceHeight * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
             const menuitem.MenuItem(text: 'Profile', icon: AppCustomIcons.profile),
             const menuitem.MenuItem(text: 'My orders', icon: AppCustomIcons.cart),
             const menuitem.MenuItem(text: 'Favorites', icon: AppCustomIcons.favorite),
             const menuitem.MenuItem(text: 'Delivery', icon: AppCustomIcons.delivery),
             const menuitem.MenuItem(text: 'Settings', icon: AppCustomIcons.settings,underline: false,),
              Padding(
                padding: EdgeInsets.only(top: deviceHeight * 0.07,left: deviceWidth * 0.22),
                child:  CircleAvatar(
                  radius: deviceHeight * 0.03,
                  backgroundColor: AppColors.authHeaderSmallOutCircleColor,
                  child:  CircleAvatar(backgroundColor: AppColors.sidedDrawerBgColor,radius: deviceHeight * 0.018 ,),
                ),
              ),
              Padding(
                 padding: EdgeInsets.only(top: deviceHeight * 0.015,),
                 child:  CircleAvatar(
                 radius: deviceHeight * 0.06,
                 backgroundColor: AppColors.authHeaderSmallOutCircleColor,
                ),
                  ),
                  const Spacer(),
                  const menuitem.MenuItem(text: 'Sign out', icon: AppCustomIcons.logout,underline: false,)
            ],
          ),

      )
    );
  }
}
class MyArc extends StatelessWidget {
  final double diameter;

  const MyArc({super.key, this.diameter = 200});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}


// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.authHeaderSmallOutCircleColor;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
