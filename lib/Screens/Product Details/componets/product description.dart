import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/common%20widget/custom_button.dart';


class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key}) : super(key: key);

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
                blurRadius: 20
              )
            ],
              color: AppColors.splashTextColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: constraints.maxWidth * 0.8478,
                height: constraints.maxHeight *  0.0656,
                margin: EdgeInsets.only(left:constraints.maxWidth * 0.1087,right: constraints.maxWidth * 0.1039,top: constraints.maxHeight * 0.0577 ),
                child: const FittedBox(
                  child: Text('White Gold Plated Princess',maxLines: 1,style: TextStyle(fontFamily: AppFonts.raleWaySemiBold,),),
                ),
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
                        child: const FittedBox(fit: BoxFit.cover,child: Text('Colors',style: TextStyle(fontFamily: AppFonts.raleWayBold),))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       height: 40,
                       width: 104,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                         border: Border.all(color: Color(0xFFE3E3E3))
                       ),
                     ),
                     Container(
                       height: 40,
                       width: 104,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           border: Border.all(color: Color(0xFFE3E3E3))
                       ),
                     ),
                     Container(
                       height: 40,
                       width: 104,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           border: Border.all(color: Color(0xFFE3E3E3))
                       ),
                     )
                   ],
                  )
                  ],
                ),
              ),
              Container(
                //color: Colors.yellow,
                margin: EdgeInsets.only(left: constraints.maxWidth * 0.1086,right: constraints.maxWidth * 0.1086,bottom: constraints.maxHeight *0.0656),
                //color: Colors.red,
                height: constraints.maxHeight * 0.2346,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('White Gold Plated Princess',maxLines: 1,style: TextStyle(fontFamily: AppFonts.raleWaySemiBold,),),
                    Container(
                     // color: Colors.red,
                        //height: constraints.maxHeight * 0.1531,
                        width: constraints.maxWidth *0.7585,
                        child: Text('Available when you purchase any new iPhone, iPad, iPod Touch, Mac or Apple TV, £4.99/month after free trial.',style: TextStyle(fontFamily: AppFonts.raleWayBold,fontSize: constraints.maxHeight *0.0298,color: AppColors.descriptionTextColor),)),
                         Row(
                           children: [
                             Text('Full description',style: TextStyle(color: AppColors.splashScreenButtonColor,fontFamily: AppFonts.raleWayBold,fontSize: constraints.maxHeight * 0.0358),),
                             SizedBox(width: 7,),
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
                     Container(
                       height: 50,
                       width: 39,
                       child: const FittedBox(child: Text('Total',style: TextStyle(fontFamily: AppFonts.raleWayRegular),),),
                     ),
                     Container(
                       child:  Text('\$${500}',style: TextStyle(color: AppColors.scaffoldBackgroundColor,fontFamily: AppFonts.raleWayBold,fontSize: 22),),
                     ),
                   ],
                 ),
               ),
              Padding(
                padding: EdgeInsets.only(left: constraints.maxWidth * 0.1208,right: constraints.maxWidth * 0.1208),
                child: CustomButton(onPressed: (){}, text: 'Add to basket'),
              )
            ],
          ),
        );
      }
    );
  }
}
