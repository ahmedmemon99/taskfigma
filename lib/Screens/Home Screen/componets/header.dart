import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc_events.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceHeight =MediaQuery.of(context).size.height;
      return PreferredSize(
          preferredSize:  Size(double.infinity,deviceSize.height * 12),
          child: Container(
            margin: EdgeInsets.only(top: deviceSize.height * 0.0758,left:deviceSize.width * 0.131,right:deviceSize.width * 0.1 ),
            child: Row(
              children: [
              GestureDetector(
                  onTap: () {
                       ZoomDrawer.of(context)!.open();
                    },
                  child:SvgPicture.asset(AppCustomIcons.homeDrawer)),
              SizedBox(width: deviceSize.width * 0.063,),
              Expanded(
                child: TextFormField(
                  onChanged: (val){

                    if(val.length > 5) {
                      context.read<ProductBloc>().add(SearchEvent());
                    }

                  },
                         style: TextStyle(color: Colors.black,fontSize:deviceHeight * 0.022,fontFamily: AppFonts.raleWaySemiBold),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.splashScreenButtonColor,
                              )
                          ),
                        contentPadding:  EdgeInsets.only(left: 12,top: deviceSize.height *0.02,bottom: deviceSize.height * 0.02),
                        enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                            width: 2,
                         color: AppColors.homeSearchBorderColor,
                    )
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(color: AppColors.authFormLabelTextColor,fontSize: 17,fontFamily: AppFonts.raleWaySemiBold),
                  prefixIcon:
                        Padding(
                          padding: const EdgeInsets.only(left: 21.0,right: 12,bottom: 18,top: 18),
                          child: SvgPicture.asset(AppCustomIcons.search),
                        )
                ),
                  onEditingComplete: (){

                    context.read<ProductBloc>().add(LoadedEvent());

                  },
              ),
              ),
            ],
          ),
        ),
    );
  }
}
