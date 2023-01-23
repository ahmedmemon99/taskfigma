import 'package:flutter/material.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../AppData/app_colors.dart';
import '../../../AppData/app_fonts.dart';
export 'package:flutter/material.dart';

class BasketInfoNotification extends StatelessWidget {
  const BasketInfoNotification({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
  }) : super(key: key);

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: deviceWidth * 0.1836,right: deviceWidth * 0.1836,top: deviceHeight * 0.0558),
      height: deviceHeight *0.0435,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: AppColors.basketInfoBannerColor,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(AppCustomIcons.notification),
          Text('Delivery for FREE until the end of the month',style: TextStyle(fontSize: deviceHeight * 0.0112,fontFamily: AppFonts.raleWayBold),),
        ],
      ),);
  }
}
