import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskappfigma/Bloc/bottom%20navigation/navigation_bloc.dart';

import '../../../AppData/app_fonts.dart';
import '../../../AppData/app_images.dart';

class BasketHeader extends StatelessWidget {
  const BasketHeader({
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                context.read<NavigationBloc>().navigateScreen(0);
              },
              child: SvgPicture.asset(AppCustomIcons.back)),
          Text('Basket',style: TextStyle(fontSize: deviceHeight * 0.0211,fontFamily: AppFonts.raleWayBold,),),
          SvgPicture.asset(AppCustomIcons.delete),
        ],
      ),
    );
  }
}
