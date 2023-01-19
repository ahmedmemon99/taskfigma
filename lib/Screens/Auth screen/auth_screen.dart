import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/Bloc/Authentication/auth_bloc.dart';
import 'package:taskappfigma/Bloc/Authentication/auth_states.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc_events.dart';
import 'package:taskappfigma/Screens/Auth%20screen/componets/auth_form.dart';
import 'package:taskappfigma/Screens/Auth%20screen/componets/auth_header.dart';

import '../Home Screen/home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const String routeName ='/authScreen';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is LoginSuccessState){
              context.read<ProductBloc>().add(LoadedEvent());
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            }
          },
        child: Scaffold(
              backgroundColor: AppColors.splashScreenButtonColor,
              resizeToAvoidBottomInset: false,
               body:SingleChildScrollView(
                 child: Container(
                      decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppCustomIcons.authBgImage),fit: BoxFit.cover)),
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children:[
                           const AuthHeader(),
                                 AuthForm()
                            ],
                    ),
        ),
      ),
    ),
);
  }
}
