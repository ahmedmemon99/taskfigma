import 'package:flutter/material.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/Screens/Auth%20screen/componets/auth_form.dart';
import 'package:taskappfigma/Screens/Auth%20screen/componets/auth_header.dart';
import 'package:taskappfigma/common%20widget/customclass.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const String routeName ='/authScreen';

  @override
  Widget build(BuildContext context) {

    final deviceSize = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor:  AppColors.scaffoldBackgroundColor,
      body:Column(
          children: const [
               AuthHeader(),
               Expanded(child: AuthForm())
          ],
        ),

    );
  }
}
