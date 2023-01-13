import 'package:flutter/material.dart';

import '../AppData/app_colors.dart';
import '../AppData/app_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.onPressed,required this.text,this.family = AppFonts.raleWayRegular}) : super(key: key);


  final VoidCallback onPressed;
  final String text;
  final String family;


  @override
  Widget build(BuildContext context) {
    final deviceHeight =MediaQuery.of(context).size.height;
    final deviceWidth =MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
            alignment: Alignment.center,
            decoration:  BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.2),blurRadius: 5,offset: const Offset(0, 3))
                ],
                color: AppColors.splashScreenButtonColor,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            width: double.infinity,
            padding:  EdgeInsets.symmetric(vertical:deviceHeight * 0.022 ),
            child:  LayoutBuilder(
              builder: (context, constraints) {
                return Text(text,
                  style:  TextStyle(
                      fontFamily: family,
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxWidth * 0.0637,
                      color: AppColors.splashTextColor
                  ),
                );
              }
            ),
          ),
       );
  }
}
