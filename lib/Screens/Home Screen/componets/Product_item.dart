import 'package:flutter/material.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/Models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key,required this.product,required this.index}) : super(key: key);

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final deviceSize =MediaQuery.of(context).size;
    final deviceHeight =MediaQuery.of(context).size.height -MediaQuery.of(context).viewPadding.top;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: LayoutBuilder(
              builder: (context, constrains) {
                return Container(
                  decoration:  BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: AppColors.productItemShadowColor.withOpacity(0.4),blurRadius: 10,offset: const Offset(0, 5))
                    ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  height: constrains.maxHeight * 0.81,
                  width: double.infinity,
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16,),
                      Container(
                        margin: EdgeInsets.only(top:  107,left: deviceSize.width * 0.09,right:  deviceSize.width * 0.09),
                        child:  Text(product.title,maxLines: 2,style: const TextStyle(fontFamily: AppFonts.raleWaySemiBold,fontSize: 22 ) ,),
                      ),
                      const SizedBox(height: 7.44,),
                      Container(
                        margin: const EdgeInsets.only(top: 7.44),
                        child:  Text('From £${product.price}',style: const TextStyle(color: AppColors.scaffoldBackgroundColor,fontFamily: AppFonts.raleWayBold,fontSize: 20),),
                      ),
                      const SizedBox(height: 30.51,)
                    ],
                  ),
                );
              }
          ),
        ),
        LayoutBuilder(
            builder: (context, constraints) {
              return Image.network(
                product.image,
                height: constraints.maxHeight * 0.5176,
                width: constraints.maxWidth * 0.7307,
                fit: BoxFit.fitWidth,
              );
            }
        )
      ],
    );
  }
}



