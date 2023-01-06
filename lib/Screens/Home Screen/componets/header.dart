import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/AppData/app_images.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key,required this.onPressed}) : super(key: key);


  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return PreferredSize(
        preferredSize:  Size(double.infinity,deviceSize.height * 12),
        child: Container(
          margin: EdgeInsets.only(top: deviceSize.height * 0.0758,left:deviceSize.width * 0.131,right:deviceSize.width * 0.1 ),
          child: Row(
            children: [
              GestureDetector(
                  onTap: onPressed ,
                  child: SvgPicture.asset(AppCustomIcons.homeDrawer)),
              SizedBox(width: deviceSize.width * 0.063,),
              Expanded(
                child: TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.splashScreenButtonColor,
                              )
                          ),
                        contentPadding:  EdgeInsets.only(left: 12,top: deviceSize.height *0.02,bottom: deviceSize.height * 0.02),
                        enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                            width: 2,
                         color: AppColors.homeSearchBorderColor,
                    )
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(color: AppColors.authFormLabelTextColor,fontSize: 17,fontFamily: AppFonts.raleWaySemiBold),
                  prefixIcon:
                        Padding(
                          padding: const EdgeInsets.only(left: 21.0,right: 12,bottom: 18,top: 18),
                          child: SvgPicture.asset(AppCustomIcons.search),
                        )
                ),
              ),
              ),
            ],
          ),
        ),
    );
  }
}
