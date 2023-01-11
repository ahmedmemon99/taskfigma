import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc_events.dart';
import 'package:taskappfigma/Screens/Home%20Screen/home_screen.dart';
import 'package:taskappfigma/common%20widget/custom_button.dart';
import '../../../Bloc/product Bloc/bloc.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top;
    return SingleChildScrollView(
      child: Container(
        height: 68.2.h,
        padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.12,
                right: MediaQuery.of(context).size.width * 0.12,
                top: MediaQuery.of(context).size.height * 0.055,
                //bottom: MediaQuery.of(context).viewPadding.bottom
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(20)),
          color: AppColors.splashTextColor
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
                Text('Login',
                style: TextStyle(
                          fontFamily: AppFonts.raleWayBold,
                          fontSize: deviceHeight * 0.024),),
              SizedBox(height: deviceHeight * 0.014,),
              TextFormField(
                style: TextStyle(color: Colors.black,fontSize:deviceHeight * 0.025,fontFamily: AppFonts.raleWaySemiBold),
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: deviceHeight * 0.012),
                  label: Row(
                    children: [
                      SvgPicture.asset(AppCustomIcons.messageIcon),
                      const SizedBox(width: 7,),
                       Text('Email',style:TextStyle(color: AppColors.authFormLabelTextColor,fontFamily: 'raleWaySemiBold',fontSize: deviceHeight * 0.025),)
                    ],
                  ),
                    suffix: TextButton(
                      style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory
                      ),
                      onPressed: () {  },
                      child:const  Text('',style: TextStyle(color: AppColors.splashScreenButtonColor,fontFamily: AppFonts.raleWaySemiBold,fontSize: 15),),)
                ),
              ),
              SizedBox(height: deviceHeight * 0.014,),
              TextFormField(
                obscureText: true,
                style: TextStyle(color: Colors.black,fontSize:deviceHeight * 0.025,fontFamily: AppFonts.raleWaySemiBold),
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: deviceHeight * 0.012),
                  label: Row(
                    children: [
                      SvgPicture.asset(AppCustomIcons.lockIcon),
                      const SizedBox(width: 7,),
                       Text('Password',style:TextStyle(color: AppColors.authFormLabelTextColor,fontFamily: 'raleWaySemiBold',fontSize:  deviceHeight * 0.025),)
                    ],),
                    suffix: TextButton(
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory
                              ),
                                onPressed: () {  },
                                 child:const  Text('Show',style: TextStyle(color: AppColors.splashScreenButtonColor,fontFamily: AppFonts.raleWaySemiBold,fontSize: 15),),)
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory),
                onPressed: () {  },
                child: Text('Forgot passcode?',
                            style: TextStyle(
                                color: AppColors.splashScreenButtonColor,
                                fontFamily: AppFonts.raleWaySemiBold,
                                fontSize: deviceHeight * 0.02),),),
              SizedBox(height: deviceHeight * 0.04),
              CustomButton(onPressed: () {
                context.read<ProductBloc>().add(LoadedEvent());
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

              },text: 'Login',),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory),
                  onPressed: () {
                  },
                  child:const  Text('Create account',
                    style: TextStyle(
                        color: AppColors.splashScreenButtonColor,
                        fontFamily: AppFonts.raleWaySemiBold,
                        fontSize: 15))),
              ),
              SizedBox(height: deviceHeight * 0.134,),

            ],
          ),
        ),
      ),
    );
  }
}
