import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';

import '../../AppData/app_images.dart';


class MenuItem extends StatelessWidget {
  const MenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final deviceHeight =MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top - MediaQuery.of(context).viewPadding.bottom;
    final deviceWidth =MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.only(bottom: deviceHeight * 0.03),
          height: deviceHeight * 0.0612,
          width:  deviceWidth * 0.39,
          child: Column(
            children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppCustomIcons.favorite),
                  const SizedBox(width: 13,),
                  const FittedBox(child: Text('Favorites',style: TextStyle(color: AppColors.splashTextColor,fontFamily: AppFonts.raleWaySemiBold,),)),
                ],
              ),
              Container(
                margin:  EdgeInsets.only(top: 23,left: 20),
                color: AppColors.menuItemDividerColor,
                height: 1,
                width: 132,
              ),
            ],
          )

        );
      }
    );

    return Row(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.0267,
            width: MediaQuery.of(context).size.width * 0.0580,
            child: FittedBox(child: SvgPicture.asset(AppCustomIcons.profile,))),
        const SizedBox(width: 13,),
       SizedBox(
           height:  MediaQuery.of(context).size.height * 0.0223,
           width: MediaQuery.of(context).size.width * 0.1256,
           child: const FittedBox(child: Text('Profile',style: TextStyle(color: AppColors.splashTextColor,fontFamily: AppFonts.raleWaySemiBold,),))),
       //const  SizedBox(height: 32,),
      ],
    );
  }
}
