import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskappfigma/AppData/app_images.dart';
import 'package:taskappfigma/Bloc/Payment%20bloc/payment_bloc.dart';



class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight =MediaQuery.of(context).size.height;
    final deviceWidth =MediaQuery.of(context).size.width;
    return Container(
      height: deviceHeight * 0.26,
      margin: EdgeInsets.only(left:  deviceWidth * 0.1208,right: deviceWidth * 0.1208,top: deviceHeight * 0.023),
      decoration:  BoxDecoration(
          color: AppColors.splashTextColor,
          borderRadius:const  BorderRadius.all(Radius.circular(10)),
          boxShadow: [
                   BoxShadow(color: AppColors.productItemShadowColor.withOpacity(0.1),blurRadius: 10,offset: const Offset(0, 10))
            ]),
      child: LayoutBuilder(
        builder: (context,constraints) {
          return Column(
            children: [
              SizedBox(height: constraints.maxHeight * 0.1159,),
              _paymentListTile(
                  PaymentMethodEnum.visa,
                  context.watch<PaymentCubit>().state,
                  context.watch<PaymentCubit>().selectPaymentMethod,
                  constraints.maxHeight,constraints.maxWidth,
                  AppImages.visa
              ),
              SizedBox(height: constraints.maxHeight * 0.1288,),
              _paymentListTile(
                  PaymentMethodEnum.masterCard,
                  context.watch<PaymentCubit>().state,
                  context.watch<PaymentCubit>().selectPaymentMethod,
                  constraints.maxHeight,constraints.maxWidth,
                  AppImages.masterCard
              ),
              SizedBox(height: constraints.maxHeight * 0.1288,),
              _paymentListTile(
                  PaymentMethodEnum.rupPay,
                  context.watch<PaymentCubit>().state,
                  context.watch<PaymentCubit>().selectPaymentMethod,
                  constraints.maxHeight,
                  constraints.maxWidth,
                  AppImages.ruPay
              )

            ],
          );
        }
      ),
    );
  }
}

    Widget _paymentListTile(value, groupValue,onChanged,maxHeight,maxWidth,image){
      return Container(
        margin: EdgeInsets.only(left: maxWidth * 0.0762,right:  maxWidth * 0.12),
        height: maxHeight * 0.1717,
        child: Row(
          children: [
            Radio(
              activeColor: AppColors.splashScreenButtonColor,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),),
             SizedBox(width: maxWidth * 0.0381,),
             Container(
               height: maxHeight * 0.1717,
               padding: const EdgeInsets.all(10),
               width: maxWidth * 0.1968,
               decoration: BoxDecoration(
                 color: AppColors.paymentCardBgColor,
                 borderRadius: const BorderRadius.all(Radius.circular(10)),
                 border: Border.all(color: AppColors.paymentCardBorderColor)
               ),
               child: SvgPicture.asset(image),
             ),
            SizedBox(width: maxWidth * 0.0540,),
            SizedBox(
                child: Text('**** **** **** 1234',style: TextStyle(fontFamily: AppFonts.raleWayRegular,fontWeight: FontWeight.w400,fontSize: maxHeight * 0.085 ),))
          ],
        ),
      );



}