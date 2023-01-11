import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';

import '../../AppData/app_images.dart';


class MenuItem extends StatelessWidget {
  const MenuItem({Key? key,required this.text,required this.icon,this.underline=true}) : super(key: key);

  final String icon;
  final String text;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    final deviceHeight =MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top - MediaQuery.of(context).viewPadding.bottom;
    final deviceWidth =MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(icon),
                SizedBox(width: deviceWidth * 0.0334,),
                 FittedBox(child: Text(text,style:  TextStyle(fontSize: 12.sp,color: AppColors.splashTextColor,fontFamily: AppFonts.raleWaySemiBold,),)),
              ],
            ),
            if(underline)Container(
              margin:EdgeInsets.only(top: deviceHeight * 0.0357, left:deviceWidth * 0.0724),
              color: AppColors.menuItemDividerColor,
              height: 1,
              width: deviceWidth * 0.3188,
            ),
            if(underline)SizedBox(height: deviceHeight * 0.03,),
          ],
        );
      }
    );
  }
}
