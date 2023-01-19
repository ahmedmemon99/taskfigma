import 'package:flutter/material.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/Models/product.dart';
import 'package:taskappfigma/Screens/Basket/componets/quantity_button.dart';

class BasketItem extends StatelessWidget {
   BasketItem({Key? key,required this.productId,required this.quantity,required this.productList}) : super(key: key);


  final int quantity;
  final int productId;
  final List<Product> productList;

  late Product product = productList.firstWhere((element) => element.id == productId);
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth =MediaQuery.of(context).size.width;
    return Container(
      height: deviceHeight * 0.15625,
      margin: EdgeInsets.only(left: deviceWidth * 0.085,right: deviceWidth * 0.085,bottom: deviceHeight * 0.0179,top: 2),
      decoration:  BoxDecoration(
          boxShadow: [
                  BoxShadow(color: AppColors.productItemShadowColor.withOpacity(0.1),blurRadius: 1,offset: const Offset(0, 10))
                ],
                color: AppColors.splashTextColor,
      borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                    child: Image.network(product.image)),
              ),
              Container(
                margin: EdgeInsets.only(left: constraints.maxWidth * 0.0255,top: constraints.maxHeight * 0.1846),
                height: constraints.maxHeight * 0.7231,
                width: constraints.maxWidth * 0.6274,
                child: LayoutBuilder(
                  builder: (context, underConstrains) {
                    return Column(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.title,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * 0.1231,
                                  fontFamily: AppFonts.raleWayBold,
                              ),),
                        SizedBox(height: underConstrains.maxHeight * 0.0538,),
                        Text(product.price,
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.1154,
                            fontFamily: AppFonts.raleWaySemiBold,
                            color: AppColors.scaffoldBackgroundColor
                          ),),
                        SizedBox(height: underConstrains.maxHeight * 0.0929,),
                        Row(
                          children: [
                            Text('Quantity',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * 0.1,
                                  fontFamily: AppFonts.raleWayRegular,
                                  fontWeight: FontWeight.w400,
                              ),),
                            SizedBox(width: constraints.maxWidth * 0.0382,),
                            QuantityButton(constraints: constraints,increment: false,),
                            SizedBox(width: constraints.maxWidth * 0.0222,),
                            Text(quantity.toString(),style: TextStyle(fontSize: constraints.maxHeight * 0.1,fontFamily: AppFonts.sfProRounded),),
                            SizedBox(width: constraints.maxWidth * 0.0222,),
                            QuantityButton(constraints: constraints,)
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

