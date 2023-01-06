import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';

import '../../AppData/app_images.dart';


class MenuItem extends StatelessWidget {
  const MenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Container(
      child: Row(
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
      ),
    );
  }
}
