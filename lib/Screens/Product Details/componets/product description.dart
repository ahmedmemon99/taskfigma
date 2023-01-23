import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/Bloc/Cart%20Bloc/cart_bloc.dart';
import 'package:taskappfigma/Screens/Product%20Details/componets/item_color_button.dart';
import 'package:taskappfigma/common%20widget/custom_button.dart';


class ProductDescription extends StatelessWidget {
   ProductDescription({Key? key,required this.title,required this.description,required this.rate}) : super(key: key);

  final String title;
  var rate;
  final String description;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration:  BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.descriptionTextColor.withOpacity(0.02),
                spreadRadius:1,
                blurRadius: 20)
            ],
              color: AppColors.splashTextColor,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
          ),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Container(
                width: constraints.maxWidth * 0.8478,
                height: constraints.maxHeight *  0.0656,
                margin: EdgeInsets.only(left:constraints.maxWidth * 0.1087,right: constraints.maxWidth * 0.1039,top: constraints.maxHeight * 0.0577 ),
                child:  Text(title,style:TextStyle(fontFamily: AppFonts.raleWaySemiBold,fontSize: constraints.maxHeight * 0.0557),),
              ),
              SizedBox(height: constraints.maxHeight * 0.0378,),
              Container(
                margin: EdgeInsets.only(left: constraints.maxWidth * 0.0942,right: constraints.maxWidth * 0.0942,bottom: constraints.maxHeight *0.0775),
                height: constraints.maxHeight * 0.1392,
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: constraints.maxHeight *0.0398,
                        width: constraints.maxWidth *0.1280,
                        child: const FittedBox(child: Text('Colors',style: TextStyle(fontFamily: AppFonts.raleWayBold),))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: List.generate(3, (index) => ItemColorButton(constraints: constraints,index: index,))
                  )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: constraints.maxWidth * 0.1086,right: constraints.maxWidth * 0.1086,bottom: constraints.maxHeight *0.0656),
                height: constraints.maxHeight * 0.2346,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(title,maxLines: 1  ,style: TextStyle(fontFamily: AppFonts.raleWaySemiBold,fontSize: constraints.maxHeight * 0.0345),),
                    SizedBox(height: constraints.maxHeight * 0.01,),
                    Text(description,maxLines: 3, style: TextStyle(fontFamily: AppFonts.raleWayRegular,fontSize: constraints.maxHeight *0.0325,color: AppColors.descriptionTextColor),),
                    SizedBox(height: constraints.maxHeight * 0.01,),
                    const Spacer(),
                    Row(
                           children: [
                             Text('Full description',style: TextStyle(color: AppColors.splashScreenButtonColor,fontFamily: AppFonts.raleWayExtraBold,fontSize: constraints.maxHeight * 0.0358),),
                             const SizedBox(width: 5,),
                             SvgPicture.asset(AppCustomIcons.next)
                           ],
                         )
                  ],
                ),
              ),
               Container(
                 margin: EdgeInsets.only(left: constraints.maxWidth * 0.1208,right: constraints.maxWidth * 0.1208,bottom: constraints.maxHeight * 0.0636),
                 height: constraints.maxHeight * 0.0518,
                 //color: Colors.red,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:  [
                     Text('Total',style:  TextStyle(fontFamily: AppFonts.raleWayRegular,fontSize: constraints.maxHeight * 0.0438),),
                      Text('\$${rate.toString()}',style: TextStyle(color: AppColors.scaffoldBackgroundColor,fontFamily: AppFonts.raleWayBold,fontSize: constraints.maxHeight * 0.0437),),
                   ],
                 ),
               ),
              Padding(
                padding: EdgeInsets.only(left: constraints.maxWidth * 0.1208,right: constraints.maxWidth * 0.1208),
                child: CustomButton(onPressed: (){
                  //context.read<CartBloc>().add(event)
                }, text: 'Add to basket',family: AppFonts.raleWayBold,),
              )
            ],
          ),
        );
      }
    );
  }
}

