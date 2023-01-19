import 'package:flutter/material.dart';

import '../../../AppData/app_colors.dart';
import '../../../AppData/app_fonts.dart';


class QuantityButton extends StatelessWidget {
  const QuantityButton({
    Key? key,
    required this.constraints,
    this.increment = true
  }) : super(key: key);

  final BoxConstraints constraints;
  final bool increment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.basketItemButtonColor,
          borderRadius: const BorderRadius.all(Radius.circular(4))
      ),
      width: constraints.maxWidth * 0.0638,
      height: constraints.maxHeight * 0.1538,
      child: Center(child: FittedBox(child: Text(increment ?'+' : '-',style: TextStyle(color: Colors.white,fontFamily: AppFonts.sfProRounded)))),
    );
  }
}