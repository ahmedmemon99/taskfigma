import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/common%20widget/drawer.dart';

import '../Product Details/product_details.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    final deviceHeight =MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top - MediaQuery.of(context).viewPadding.bottom;
    final deviceWidth =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body:Column(
        children:  [
           Container(
             height: deviceHeight * 0.1540,
             margin:  EdgeInsets.only(top: deviceHeight * 0.0792,left: deviceWidth * 0.14,right: deviceWidth * 0.14,bottom: deviceHeight * 0.0325),
             width:   deviceWidth * 0.705,
             child: const FittedBox(
               child: Text(
                    'Find your\nGadget',
                          style:  TextStyle(
                          color: AppColors.splashTextColor,
                          fontFamily: AppFonts.raleWayExtraBold
                    )),
             ),
            ),
          SizedBox(
              height: deviceHeight * 0.4772,
              child: Image.asset(AppImages.splashImg,)),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/authScreen'),
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration:  BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.4),blurRadius: 20)
                ],
                  color: AppColors.splashTextColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              width: double.infinity,
              margin:  EdgeInsets.only(left: deviceWidth * 0.12,right: deviceWidth * 0.072,top: deviceHeight *  0.0714,bottom: deviceHeight * 0.136),
              padding:  EdgeInsets.symmetric(vertical:deviceHeight * 0.022 ),
              child: const Text('Get Started',
                style: TextStyle(
                    fontFamily: AppFonts.raleWayRegular,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.splashScreenButtonColor
                ),
              ),
            ),
          ),
       ],
      )
    );
  }
}
