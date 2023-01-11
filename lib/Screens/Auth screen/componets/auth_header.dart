import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: deviceSize.height * 0.07, top: deviceSize.height * 0.1104),
      child: Stack(
        children:[
          Text(
            'Welcome\nback',
            style: TextStyle(
              fontSize: 7.25.h,
              fontFamily:  AppFonts.raleWayExtraBold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3
                ..color = Colors.black,
            ),
          ),
            Text(
            'Welcome\nback',
            style: TextStyle(
              fontSize: 7.25.h,
              fontFamily:  AppFonts.raleWayExtraBold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
