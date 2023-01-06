import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/Bloc/bloc_events.dart';
import 'package:taskappfigma/Screens/Home%20Screen/home_screen.dart';
import 'package:taskappfigma/common%20widget/custom_button.dart';

import '../../../Bloc/bloc.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.12,
              right: MediaQuery.of(context).size.width * 0.12,
              top: MediaQuery.of(context).size.height * 0.05
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(20)),
        color: AppColors.splashTextColor
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
             const Text('Login',
              style: TextStyle(
                        fontFamily: AppFonts.raleWayBold,
                        fontSize: 18),),
            const SizedBox(height: 20,),

            TextFormField(
              decoration:  InputDecoration(
                label: Row(
                  children: [
                    SvgPicture.asset(AppCustomIcons.messageIcon),
                    const SizedBox(width: 7,),
                    const Text('Email',style:TextStyle(color: AppColors.authFormLabelTextColor,fontFamily: 'raleWaySemiBold',fontSize: 18),)
                  ],
                ),
              ),
            ),
            const  SizedBox(height: 12,),
            TextFormField(
              decoration:  InputDecoration(
                label: Row(
                  children: [
                    SvgPicture.asset(AppCustomIcons.lockIcon),
                    const SizedBox(width: 7,),
                    const Text('Password',style:TextStyle(color: AppColors.authFormLabelTextColor,fontFamily: 'raleWaySemiBold',fontSize: 18),)
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
              child:const  Text('Forgot passcode?',
                          style: TextStyle(
                              color: AppColors.splashScreenButtonColor,
                              fontFamily: AppFonts.raleWaySemiBold,
                              fontSize: 15),),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
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
                      fontSize: 15),),),
            )

          ],
        ),
      ),
    );
  }
}
