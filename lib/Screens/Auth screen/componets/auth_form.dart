import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/Bloc/Authentication/auth_bloc.dart';
import 'package:taskappfigma/Bloc/Authentication/auth_events.dart';
import 'package:taskappfigma/Bloc/Authentication/auth_states.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc.dart';
import 'package:taskappfigma/Screens/Home%20Screen/home_screen.dart';
import 'package:taskappfigma/common%20widget/custom_button.dart';

import '../../../Bloc/product Bloc/bloc_events.dart';

class AuthForm extends StatefulWidget {
   AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> _pwdKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top;
    return Container(
      padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.12,
              right: MediaQuery.of(context).size.width * 0.12,
              top: MediaQuery.of(context).size.height * 0.055,
              bottom: MediaQuery.of(context).viewInsets.bottom,
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
            Text('Login', style: TextStyle(fontFamily: AppFonts.raleWayBold, fontSize: deviceHeight * 0.024),),
            SizedBox(height: deviceHeight * 0.014,),
            _buildEmailTextField(context, deviceHeight,_emailKey),
            SizedBox(height: deviceHeight * 0.014,),
            _buildPasswordTextField(context, deviceHeight,_pwdKey),
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
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                  if(state is AuthLoadingState){
                    return  Container(
                      alignment: Alignment.center,
                        width: double.infinity,
                        child: const CircularProgressIndicator(color:AppColors.splashScreenButtonColor,));
                   }

                   if(state is LoginFailState) {
                      return CustomButton(onPressed: () =>context.read<AuthBloc>().add(LoginEvent(emailKey: _emailKey, pwdKey: _pwdKey)), text: 'Login',);
                   }
                      return CustomButton(onPressed: () => context.read<AuthBloc>().add(LoginEvent(emailKey: _emailKey, pwdKey: _pwdKey)), text: 'Login',);
                    },
           ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory),
                onPressed: () {},
                child:  Text('Create account',
                  style: TextStyle(
                      color: AppColors.splashScreenButtonColor,
                      fontFamily: AppFonts.raleWaySemiBold,
                      fontSize: deviceHeight * 0.0190))),
            ),
            SizedBox(height: deviceHeight * 0.134,),
          ],
        ),
      ),
    );
  }
}


Widget _buildEmailTextField(context,deviceHeight,key){
  return TextFormField(
    key: key,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: BlocProvider.of<AuthBloc>(context).emailController,
    validator: (val){
        if(val!.isEmpty){
          return 'Email is required';
        }else if(!val!.contains('@') || !val.contains('.')){
          return 'Enter valid email';
        }
        return null;
    },
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
  );
}

Widget _buildPasswordTextField(context,deviceHeight,key){
  return TextFormField(
    key: key,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: (val){
      BlocProvider.of<AuthBloc>(context).add(ErrorEvent(emailText: BlocProvider.of<AuthBloc>(context).emailController.text, passwordText: val));
    },
    validator: (val){
      if(val!.length < 8){
        return 'Enter minimum 8 character password';
      }
      return null;
    },
    controller:  BlocProvider.of<AuthBloc>(context).passwordController,
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
              splashFactory: NoSplash.splashFactory),
          onPressed: () {  },
          child:const  Text('Show',style: TextStyle(color: AppColors.splashScreenButtonColor,fontFamily: AppFonts.raleWaySemiBold,fontSize: 15),),)
    ),
  );
}
