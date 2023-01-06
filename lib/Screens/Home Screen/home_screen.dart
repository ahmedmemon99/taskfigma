import 'dart:math';

import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/Bloc/bloc.dart';
import 'package:taskappfigma/Bloc/bloc_states.dart';
import 'package:taskappfigma/Screens/Home%20Screen/componets/product_listview.dart';
import 'package:taskappfigma/Screens/menu%20screen/menu_screen.dart';
import 'componets/header.dart';




class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/homeScreen';


  final  controller =AwesomeDrawerBarController();

  @override
  Widget build(BuildContext context) {
    final devicSize =MediaQuery.of(context).size;
    return Scaffold(
        drawer:  AwesomeDrawerBar(
        controller: controller,
        menuScreen:const MenuScreen(),
        type: StyleState.scaleRight,
        mainScreen: this,
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,

        backgroundColor: AppColors.sidedDrawerBgColor,
        slideWidth: MediaQuery.of(context).size.width* 0.6,
      ),
      backgroundColor: AppColors.homeScreenBgColor,
      appBar:PreferredSize(preferredSize:Size.fromHeight(MediaQuery.of(context).size.height * 0.12 ),
              child:  HomeHeader(
                          onPressed: (){

                          controller.open!();

                         },)),
      body: Column(
        children:  [
          Container(
            margin: EdgeInsets.only(left: devicSize.width * 0.121,top: devicSize.height * 0.0613,right: devicSize.width * 0.121,bottom: 40 ),
            child:   Text('Order online\ncollection in Store',
                  style: TextStyle(fontSize: devicSize.width * 0.0821 ,fontFamily: AppFonts.raleWayBold)
               ),
            ),
           BlocBuilder<ProductBloc,ProductStates>(
            builder: (context,state){
              if(state is LoadingState){
                return
                 const Expanded(child: Center(child: CircularProgressIndicator(),),);
              }
              if(state is LoadedState){
                return
                 Expanded(
                    child: ProductListView( list: state.list,)
                );
              }
              return const Center(child: Text('No Items Found'));
            },),
        ],
      )
    );
  }
}
