import 'package:flutter/material.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'menu_item.dart' as menuitem;


class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight =MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top - MediaQuery.of(context).viewPadding.bottom;
    final deviceWidth =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.sidedDrawerBgColor,
      body: Padding(
        padding: EdgeInsets.only(top: deviceHeight * 0.1768,left: deviceWidth * 0.111),
        child:
        Column(
          children: [
            ...List.generate(5, (index) => const menuitem.MenuItem()),
          ],
        ),
      )
    );
  }
}
