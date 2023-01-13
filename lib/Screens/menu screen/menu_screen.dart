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
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(preferredSize: Size.fromHeight(deviceHeight * 0.1735),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(),
            margin:  EdgeInsets.only(right: deviceWidth * 0.1522),
            alignment: Alignment.topRight,
            //color: Colors.red,
            child:Container(
                height: deviceHeight * 0.1350,
                width: deviceWidth * 0.2923,
                child: SvgPicture.asset(AppCustomIcons.menuScreenCircle))
          ),
          Container(
            margin: EdgeInsets.only(right: deviceWidth * 0.0483),
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
              CircleAvatar(
              radius: deviceHeight * 0.04,
              backgroundColor: AppColors.authHeaderSmallOutCircleColor,
                ),
                  const Spacer(),
                  const menuitem.MenuItem(text: 'Sign out', icon: AppCustomIcons.logout,underline: false,)
            ],
          ),

      )
    );
  }
}



