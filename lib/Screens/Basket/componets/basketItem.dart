import 'package:flutter/material.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';

class BasketItem extends StatelessWidget {
  const BasketItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth =MediaQuery.of(context).size.width;
    return Container(
      height: deviceHeight * 0.1563,
      margin: EdgeInsets.only(left: deviceWidth * 0.1208,right: deviceWidth * 0.1208,bottom: deviceHeight * 0.0179),
      decoration: const BoxDecoration(
        color: AppColors.splashTextColor,
      borderRadius: BorderRadius.all(Radius.circular(10))),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Container(
                margin: EdgeInsets.only(left: constraints.maxWidth * 0.0478,top: constraints.maxHeight * 0.0923,bottom: constraints.maxHeight * 0.0923),
                height: constraints.maxHeight * 0.8077,
                width: constraints.maxWidth * 0.2548,
                //color: Colors.red,
                child: FittedBox(
                    child: Image.network('https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg')),
              ),
              Container(
                margin: EdgeInsets.only(left: constraints.maxWidth * 0.0255,top: constraints.maxHeight * 0.1923,bottom:constraints.maxHeight * 0.1923),
                height: constraints.maxHeight *0.6154,
                width: constraints.maxWidth * 0.6178,
                child: LayoutBuilder(
                  builder: (context, underConstrains) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2020 Apple iPad Air 10.9"',
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * 0.1231,
                                  fontFamily: AppFonts.raleWaySemiBold,
                              ),),
                        Text('\$579.00',
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.1154,
                            fontFamily: AppFonts.raleWaySemiBold,
                            color: AppColors.scaffoldBackgroundColor
                          ),),
                        Row(
                          children: [
                            Text('Quantity',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * 0.1,
                                  fontFamily: AppFonts.raleWayRegular,
                                  fontWeight: FontWeight.w400,
                              ),),
                            SizedBox(width: constraints.maxWidth * 0.0382,),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.basketItemButtonColor,
                                borderRadius: const BorderRadius.all(Radius.circular(4))
                              ),
                              width: constraints.maxWidth * 0.0638,
                              height: constraints.maxHeight * 0.1538,
                              child: const Center(child: FittedBox(child: Text('-',style: TextStyle(color: Colors.white,fontFamily: AppFonts.sfProRounded)))),
                            ),
                            SizedBox(width: constraints.maxWidth * 0.0222,),
                            Text('1',style: TextStyle(fontSize: constraints.maxHeight * 0.1,fontFamily: AppFonts.sfProRounded),),
                            SizedBox(width: constraints.maxWidth * 0.0222,),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.basketItemButtonColor,
                                  borderRadius: const BorderRadius.all(Radius.circular(4))
                              ),
                              width: constraints.maxWidth * 0.0638,
                              height: constraints.maxHeight * 0.1538,
                              child: const Center(child: FittedBox(child: Text('+',style: TextStyle(color: Colors.white,fontFamily: AppFonts.sfProRounded)))),
                            )
                          ],

                        )
                      ],
                    );
                  }
                ),
              )

            ],
          );
        }
      ),
    );
  }
}
