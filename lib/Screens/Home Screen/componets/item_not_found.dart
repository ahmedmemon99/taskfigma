import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/AppData/app_images.dart';

class ItemNotFound extends StatelessWidget {
  const ItemNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight =MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: deviceWidth * 0.1208,right:deviceWidth * 0.1208,top: deviceHeight * 0.0379,bottom: deviceHeight * 0.0146),
            child:Image.asset(AppImages.notfoundImg,fit: BoxFit.cover,)),
        Text('Item not found',style: TextStyle(fontSize: deviceHeight * 0.0313,fontFamily: AppFonts.raleWaySemiBold),),
        Container(
            margin: EdgeInsets.only(left: deviceWidth * 0.1208,right:deviceWidth * 0.1208,top: deviceHeight * 0.0379),
            child: FittedBox(child: Text('Try a more generic search term or try\n     looking for alternative products.',style: TextStyle(fontSize: deviceHeight * 0.0313,fontFamily: AppFonts.raleWayRegular),)))
      ],
    );
  }
}
