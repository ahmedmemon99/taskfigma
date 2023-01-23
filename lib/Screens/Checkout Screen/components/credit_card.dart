import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/Bloc/Payment%20bloc/payment_bloc.dart';

import '../../../AppData/app_images.dart';
import '../../../Bloc/Payment bloc/payment_bloc.dart';


class CreditCard extends StatelessWidget {
  const CreditCard({Key? key,required this.constraints}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final deviceHeight =  MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(right: constraints.maxWidth *0.1208,top: constraints.maxHeight * 0.0877),
      height: deviceHeight * 0.2064,
      decoration: BoxDecoration(
        color: AppColors.paymentCardBgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: AppColors.paymentCardBorderColor)
      ),
      child: LayoutBuilder(
        builder: (context,constraints) {
          return Padding(
            padding:  EdgeInsets.only(top: constraints.maxHeight * 0.1437),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.0482),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.1198,
                        width: constraints.maxWidth * 0.3730,
                        child: const FittedBox(child: Text('My credit card',style: TextStyle(fontFamily: AppFonts.raleWayRegular,fontWeight: FontWeight.w600),)),
                      ),
                      Container(
                        height: constraints.maxHeight * 0.2395,
                        padding:  EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.0193,vertical:constraints.maxHeight * 0.0253),
                        width: constraints.maxWidth * 0.1994,
                        decoration: BoxDecoration(
                            color: AppColors.paymentCardBgColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: AppColors.paymentCardBorderColor)
                        ),
                        child: context.watch<PaymentCubit>().state == PaymentMethodEnum.visa ? SvgPicture.asset(AppImages.visa,) : 
                               context.watch<PaymentCubit>().state == PaymentMethodEnum.masterCard ? SvgPicture.asset(AppImages.masterCard,) :
                               SvgPicture.asset(AppImages.ruPay)    

                      ),
                    ],),
                ),
                SizedBox(height: constraints.maxHeight * 0.0273,),
                Container(
                  margin: EdgeInsets.only(left: constraints.maxWidth * 0.0482),
                  height: constraints.maxHeight * 0.2575,
                  width: constraints.maxWidth * 0.7942,
                  child: const FittedBox(child: Text('**** **** **** 1234',style: TextStyle(fontFamily: AppFonts.raleWayRegular,fontWeight: FontWeight.w400),),),
                ),

                Padding(
                  padding:EdgeInsets.only(left: constraints.maxWidth * 0.0777,top: constraints.maxHeight * 0.08),
                  child: Row(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.1078,
                        child: FittedBox(child: Text('Rosina Doe',style: TextStyle(color: AppColors.bottomSheetProductCountTextColor,fontFamily: AppFonts.raleWaySemiBold,),)),
                      ),
                    SizedBox(width: constraints.maxWidth * 0.4727,),
                    SizedBox(
                      height: constraints.maxHeight * 0.1078,
                      child: FittedBox(child: Text('04/26',style: TextStyle(color: AppColors.bottomSheetProductCountTextColor,fontFamily: AppFonts.raleWaySemiBold,),)),
                    ),
                  ],),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
