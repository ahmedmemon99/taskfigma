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
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late PageController controller;
//   double page = 0.0;
//   @override
//   void initState() {
//     super.initState();
//     controller = PageController(viewportFraction: 0.5)
//       ..addListener(() {
//         setState(() {
//           page = controller.page!;
//         });
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Container(
//           width: 200,
//           height: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(26),
//             color: Colors.white,
//           ),
//           child: Column(children: [
//             Expanded(
//               child: PageView.builder(
//                 controller: controller,
//                 itemCount: pages.length,
//                 itemBuilder: (context, index) {
//                   if (index == page) {
//                     return Transform.scale(
//                       scale: 1,
//                       child: pages[index],
//                     );
//                   } else if (index < page) {
//                     return Transform.scale(
//                       scale: max(1 - (page - index), 0.75),
//                       child: pages[index],
//                     );
//                   } else {
//                     return Transform.scale(
//                       scale: max(1 - (index - page), 0.75),
//                       child: pages[index],
//                     );
//                   }
//                 },
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
//
//   List<Widget> pages = [
//     FlutterLogo(
//       size: 100,
//     ),
//     FlutterLogo(
//       size: 100,
//     ),
//     FlutterLogo(
//       size: 100,
//     ),
//   ];
// }