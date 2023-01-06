import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/Bloc/bloc.dart';
import 'package:taskappfigma/Routes/routes.dart';
import 'package:taskappfigma/Screens/Splash%20Screen/splash_screen.dart';

void main()async{


  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
 // runApp(DevicePreview(builder: (c)=> TaskFigmaApp(),enabled: true,));
 runApp(const  TaskFigmaApp());
}

class TaskFigmaApp extends StatelessWidget {
  const TaskFigmaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        initialRoute: SplashScreen.routeName,
        routes: AppRoutes.getRoutes(context),
      ),
    );
  }
}
