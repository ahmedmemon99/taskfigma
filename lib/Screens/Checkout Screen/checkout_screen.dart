library checkout;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/Bloc/Cart%20Bloc/cart_bloc.dart';
import 'package:taskappfigma/Screens/Checkout%20Screen/components/payment_method.dart';
import 'package:taskappfigma/Screens/Checkout%20Screen/components/shipping_information.dart';

import '../../common widget/custom_button.dart';
import 'components/checkout_header.dart';
import 'components/credit_card.dart';


class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  static const String routName ='/checkOUt';

  @override
  Widget build(BuildContext context) {
    final deviceHeight =MediaQuery.of(context).size.height-MediaQuery.of(context).viewPadding.top -MediaQuery.of(context).viewPadding.bottom;
    final deviceWidth =MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.homeScreenBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckOutHeader(deviceHeight: deviceHeight, deviceWidth: deviceWidth),
          SizedBox(height: deviceHeight * 0.0692,),
         _buildShippingDetailsTitle(deviceHeight,deviceWidth),
          const ShippingInformation(),
          Container(
              margin: EdgeInsets.only(left: deviceWidth * 0.1208,top: deviceHeight * 0.03125),
              height: deviceHeight * 0.0253,
                   child: FittedBox(child: Text('Payment Method',style: TextStyle(color: AppColors.black,fontFamily: AppFonts.raleWayBold,),))),
          const PaymentMethod(),
          const Spacer(),
          _buildCheckOutFooter(deviceHeight, deviceWidth,context),
          Padding(
            padding: EdgeInsets.only(left: deviceWidth * 0.085,right: deviceWidth * 0.085,bottom: deviceHeight * 0.0502),
            child: CustomButton(onPressed: () => _showBottomSheet(context),
            text: 'Confirm and pay',family: AppFonts.raleWayBold,),
          )
        ],
      ),
    );
  }
}


    Widget _buildShippingDetailsTitle(deviceHeight,deviceWidth){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1208),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: deviceHeight * 0.0253,
                child: FittedBox(child: Text('Shipping information',style: TextStyle(color: AppColors.black,fontFamily: AppFonts.raleWayBold,),))),
            SizedBox(
                height: deviceHeight * 0.0201,
                child: const FittedBox(child: Text('Change',style: TextStyle(color: AppColors.splashScreenButtonColor,fontFamily: AppFonts.raleWayBold,),)))
          ],
        ),
      );
}
      
      Widget _buildCheckOutFooter(deviceHeight,deviceWidth,context){
        return Padding(
          padding:EdgeInsets.only(bottom: deviceHeight * 0.0569,left: deviceWidth * 0.1232,right: deviceWidth * 0.1232),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text('Total',style:TextStyle(fontFamily: AppFonts.raleWayRegular,fontSize: deviceHeight * 0.0190),),
               Text('\$${BlocProvider.of<CartBloc>(context,listen: true).total}',style:TextStyle(color: AppColors.scaffoldBackgroundColor,fontFamily: AppFonts.raleWayBold,fontSize: deviceHeight * 0.0246),)
            ]
              ),
          );
}

 void _showBottomSheet(context){
      showModalBottomSheet(context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context){
              return Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0480,left: MediaQuery.of(context).size.width * 0.1208),
                decoration: const BoxDecoration(
                   color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(18),topRight: Radius.circular(22.5),)),
                    height: MediaQuery.of(context).size.height *0.5725,
                    width: double.infinity,
                    child: LayoutBuilder(
                      builder: (context,constraints) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Confirm and pay',style: TextStyle(fontFamily: AppFonts.raleWayBold,fontSize: constraints.maxHeight * 0.0391 ),),
                                  SizedBox(width: constraints.maxWidth * 0.2415,),
                                  Container(
                                    height: constraints.maxHeight * 0.0412,
                                    child: FittedBox(
                                      child: RichText(text:
                                      TextSpan(
                                        text: 'Products: ',
                                        style: TextStyle(color: AppColors.bottomSheetProductCountTextColor,fontFamily: AppFonts.raleWaySemiBold,),
                                        children: [
                                          TextSpan(text: BlocProvider.of<CartBloc>(context).cartListLength.toString(),style: TextStyle(color:AppColors.black,fontFamily: AppFonts.raleWaySemiBold,)),
                                        ]
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            CreditCard(constraints: constraints,),
                            const Spacer(),
                            Padding(
                              padding:  EdgeInsets.only(right: constraints.maxWidth * 0.1280),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text('Total',style:TextStyle(fontFamily: AppFonts.raleWayRegular,fontSize: MediaQuery.of(context).size.height * 0.0190),),
                                    Text('\$${BlocProvider.of<CartBloc>(context,listen: true).total}',style:TextStyle(color: AppColors.scaffoldBackgroundColor,fontFamily: AppFonts.raleWayBold,fontSize: MediaQuery.of(context).size.height * 0.0246),)
                                  ]
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right:constraints.maxWidth * 0.1208,bottom: constraints.maxHeight * 0.0799,top: constraints.maxHeight * 0.0954),
                              child: CustomButton(onPressed: () => _showBottomSheet(context),
                                text: 'Pay now',family: AppFonts.raleWayBold,),
                            )
                          ],);
                      }
                    ),
              );
      });

 }
      