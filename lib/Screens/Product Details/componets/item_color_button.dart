import 'package:flutter/material.dart';

import '../../../AppData/app_colors.dart';
import '../../../AppData/app_fonts.dart';

class ItemColorButton extends StatelessWidget {

  final List<Map> myColors = [
    {'name': 'Sky Blue' ,'color': 0xFF7485C1},
    {'name': 'Rose Gold' ,'color': 0xFFC9A19C},
    {'name': 'Green' ,'color': 0xFFA1C89B},
  ];


  ItemColorButton({Key? key,required this.constraints,required this.index}) : super(key: key);
  final BoxConstraints constraints;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
          height: constraints.maxHeight * 0.0795,
          width: constraints.maxWidth * 0.2512,
          decoration: BoxDecoration(
            color: AppColors.splashTextColor,
              boxShadow:  [
                BoxShadow(color: AppColors.productItemShadowColor.withOpacity(0.5),blurRadius: 20)
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: const Color(0xFFE3E3E3))
          ),
          child: LayoutBuilder(
            builder: (context, underConstraints) {
              return Row(
                children: [
                  Container(
                    margin:EdgeInsets.only(top: underConstraints.maxHeight * 0.3,bottom: underConstraints.maxHeight * 0.3,left: underConstraints.maxWidth * 0.125,right: underConstraints.maxWidth * 0.0769),
                    height: underConstraints.maxHeight * 0.4,
                    width: underConstraints.maxWidth * 0.1538,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(myColors[index]['color']),
                    ),
                  ),
                    //  const CircleAvatar(
                    //   backgroundColor: Colors.brown,
                    // ),
                  Text(myColors[index]['name'],style: TextStyle(fontFamily: AppFonts.raleWayBold,fontSize: constraints.maxHeight * 0.0238),)
                ],
              );
            }
          ),
        );

  }
}
