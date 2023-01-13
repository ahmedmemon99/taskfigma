import 'package:flutter/material.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/Screens/Auth%20screen/componets/auth_form.dart';
import 'package:taskappfigma/Screens/Auth%20screen/componets/auth_header.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const String routeName ='/authScreen';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppCustomIcons.authBgImage),fit: BoxFit.fill)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
                 AuthHeader(),
                 Expanded(child: AuthForm())
            ],
          ),
      ),
    );
  }
}
