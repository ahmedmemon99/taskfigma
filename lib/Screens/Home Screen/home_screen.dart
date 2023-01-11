import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc_states.dart';
import 'package:taskappfigma/Screens/Home%20Screen/componets/product_listview.dart';
import 'package:taskappfigma/Screens/Home%20Screen/componets/bottomnavigation.dart';
import 'componets/header.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/homeScreen';

  @override
  Widget build(BuildContext context) {
    final devicSize =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.homeScreenBgColor,
      appBar: PreferredSize(preferredSize:Size.fromHeight(MediaQuery.of(context).size.height * 0.12 ),
              child: const HomeHeader()),
      body: ListView(
             physics: const BouncingScrollPhysics(),
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
                       const Center(child: CircularProgressIndicator(),);
                   }
                   if(state is LoadedState){
                     return
                       ProductListView( list: state.list,);
                   }
                   return const Center(child: Text('No Items Found'));
                 },),
       ],
     ),
      bottomNavigationBar: const BottomNavigation()
    );
  }
}

