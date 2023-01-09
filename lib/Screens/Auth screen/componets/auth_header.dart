import 'package:flutter/material.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Column(
          children:  [
            Transform(
              transform: Matrix4.translationValues(-90, 0, 0.0),
              child: const CircleAvatar(
                radius: 27,
                backgroundColor: AppColors.authHeaderSmallOutCircleColor,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.scaffoldBackgroundColor,),
              ),
            ),
            Padding(
              padding: EdgeInsets.only( left: deviceSize.width * 0.12),
              child: Stack(
                children:[
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      fontFamily:  AppFonts.raleWayExtraBold,
                      fontSize: 65,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 5
                        ..color = Colors.black,
                    ),
                  ),
                  const Text(
                    'Welcome back',
                    style: TextStyle(
                      fontFamily:  AppFonts.raleWayExtraBold,
                      fontSize: 65,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(140, -60, 0.0),
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.authHeaderSmallOutCircleColor,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.scaffoldBackgroundColor,),
              ),
            ),
          ],
        ),
         Positioned(    
          top: -95,
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration:  const BoxDecoration(
                gradient:  LinearGradient(
                  stops: [
                    0.01,
                    0.6,
                  ],
                  begin: Alignment.center,
                 end: Alignment.bottomCenter,
                 colors: [
                        AppColors.authHeaderCircleColor,
                        AppColors.scaffoldBackgroundColor
                  ]
                ),
                shape: BoxShape.circle,
                //color:  AppColors.authHeaderCircleColor
              ),
              height: MediaQuery.of(context).size.height * 0.22,
              width : MediaQuery.of(context).size.height * 0.18,
              ),
          ),
        )
      ],
    );
  }
}
