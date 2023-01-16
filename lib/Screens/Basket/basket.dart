library basket;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/Screens/Basket/componets/basketItem.dart';
import 'package:taskappfigma/common%20widget/custom_button.dart';

import '../../AppData/app_fonts.dart';


class  Basket extends StatelessWidget {
  const Basket ({Key? key}) : super(key: key);

  static const String routeName ='/basket';


  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.homeScreenBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Padding(
               padding:  EdgeInsets.only(top: deviceHeight * 0.0625,left:deviceWidth * 0.07,right:deviceWidth * 0.07),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                       SvgPicture.asset(AppCustomIcons.back),
                       Text('Basket',style: TextStyle(fontSize: deviceHeight * 0.0211,fontFamily: AppFonts.raleWayBold,),),
                       SvgPicture.asset(AppCustomIcons.delete),
                     ],
                  ),
                ),
            Container(
              padding: EdgeInsets.only(left: deviceWidth * 0.0266,right:deviceWidth * 0.0266),
              margin: EdgeInsets.only(left: deviceWidth * 0.1836,right: deviceWidth * 0.1836,top: deviceHeight * 0.0558),
              height: deviceHeight *0.0435,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: AppColors.basketInfoBannerColor,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(AppCustomIcons.notification),
                  Text('Delivery for FREE until the end of the month',style: TextStyle(fontSize: deviceHeight * 0.0112,fontFamily: AppFonts.raleWaySemiBold),),
                ],
              ),),
         // SizedBox(height: 10),
          Flexible(
            child: ListView(
              padding: EdgeInsets.only(top: deviceHeight * 0.0134),
              shrinkWrap: true,
              children: List.generate(2, (index) => const BasketItem()),
            ),
          ),

          Spacer(),
          Padding(
            padding:  EdgeInsets.only(left: deviceWidth * 0.1208,right: deviceWidth * 0.1208,bottom: deviceHeight * 0.0502),
            child: CustomButton(onPressed: (){}, text: 'CheckOut'),
          )
        ],
      ),
    );
  }
}
