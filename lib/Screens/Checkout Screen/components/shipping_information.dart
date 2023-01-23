import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';

import '../../../AppData/app_images.dart';



class ShippingInformation extends StatelessWidget {
  const ShippingInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight =MediaQuery.of(context).size.height;
    final deviceWidth =MediaQuery.of(context).size.width;
    return Container(
      height: deviceHeight * 0.1853,
      margin: EdgeInsets.only(left:  deviceWidth * 0.1208,right: deviceWidth * 0.1208,top: deviceHeight * 0.0223),
      decoration:  BoxDecoration(
         color: AppColors.splashTextColor,
         borderRadius:const  BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: AppColors.productItemShadowColor.withOpacity(0.1),blurRadius: 10,offset: const Offset(0, 10))
          ]
      ),
      child: LayoutBuilder(
        builder: (context,constraints) {
          final maxHeight = constraints.maxHeight;
          final maxWidth = constraints.maxWidth;
          return Padding(
            padding:  EdgeInsets.only(left: maxWidth * 0.0952,top: maxHeight * 0.1265),
            child: Column(
              children: [
                ShippingInfoItem(maxHeight: maxHeight, maxWidth: maxWidth, icon: AppCustomIcons.profile, text:'Rosina Doe'),
                SizedBox(height: maxHeight *0.0304,),
                ShippingInfoItem(maxHeight: maxHeight, maxWidth: maxWidth, icon: AppCustomIcons.location, text:' Oxford Road   Oxford Road    Oxford Road'),
                SizedBox(height: maxHeight *0.0804,),
                ShippingInfoItem(maxHeight: maxHeight, maxWidth: maxWidth, icon: AppCustomIcons.call, text:'Rosina Doe'),
              ],
            ),
          );
        }
      ),
    );
  }
}


   class ShippingInfoItem extends StatelessWidget {
     const ShippingInfoItem({Key? key,required this.maxHeight,required this.maxWidth,required this.icon,required this.text}) : super(key: key);

     final double maxHeight;
     final double maxWidth;
     final String icon;
     final String text;

     @override
     Widget build(BuildContext context) {
       return Row(
         children: [
           SvgPicture.asset(icon,color: AppColors.black,),
           SizedBox(width: maxWidth * 0.0317,),
           SizedBox(
               width: maxWidth * 0.7714,
               child: Text(text,style: TextStyle(fontFamily: AppFonts.raleWaySemiBold,fontWeight: FontWeight.w400,fontSize: maxHeight * 0.1012),)),
         ],
       );
     }
   }
