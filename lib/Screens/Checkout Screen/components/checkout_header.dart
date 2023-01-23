import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../AppData/app_fonts.dart';
import '../../../AppData/app_images.dart';

class CheckOutHeader extends StatelessWidget {
  const CheckOutHeader({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: deviceHeight * 0.0625,left:deviceWidth * 0.07,right:deviceWidth * 0.07),
      child: Row(
        children: [
          GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(AppCustomIcons.back)),
          SizedBox(width: deviceWidth * 0.2729,),
          Text('Checkout',style: TextStyle(fontSize: deviceHeight * 0.0211,fontFamily: AppFonts.raleWayBold,),),
        ],
      ),
    );
  }
}
