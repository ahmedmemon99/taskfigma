import 'package:flutter/material.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/Screens/Basket/componets/quantity_button.dart';

class LoadingBasketItem extends StatelessWidget {
  const LoadingBasketItem({Key? key}) : super(key: key);

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
                  color: AppColors.homeScreenBgColor,
                  margin: EdgeInsets.only(left: constraints.maxWidth * 0.0478,top: constraints.maxHeight * 0.0923,bottom: constraints.maxHeight * 0.0923),
                  height: constraints.maxHeight * 0.8077,
                  width: constraints.maxWidth * 0.2548,
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
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: AppColors.homeScreenBgColor,
                              ),
                              height: constraints.maxHeight * 0.15,
                            ),
                            SizedBox(height: underConstrains.maxHeight * 0.0538,),
                            Container(
                              margin: EdgeInsets.only(right: constraints.maxWidth * 0.3),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: AppColors.homeScreenBgColor,
                              ),
                              height: constraints.maxHeight * 0.15,
                            ),
                            SizedBox(height: underConstrains.maxHeight * 0.0929,),
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

