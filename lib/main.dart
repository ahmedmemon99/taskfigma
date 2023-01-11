import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/Bloc/bottom%20navigation/navigation_bloc.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc.dart';
import 'package:taskappfigma/Routes/routes.dart';
import 'package:taskappfigma/Screens/Splash%20Screen/splash_screen.dart';
import 'package:sizer/sizer.dart';
void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);

  //runApp(DevicePreview(builder: (context) =>TaskFigmaApp(),));
  runApp(const  TaskFigmaApp());
}

class TaskFigmaApp extends StatelessWidget {
  const TaskFigmaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc(),),
        BlocProvider(create: (context) => NavigationBloc())
      ],
      child: Sizer(
        builder: (context,orientation,deviceType){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: AppRoutes.getRoutes(context),
          );
        },
    ));
  }
}
