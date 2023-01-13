import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/AppData/app_fonts.dart';
import 'package:taskappfigma/Models/product.dart';
import 'package:taskappfigma/Screens/Product%20Details/product_details.dart';

import '../../../AppData/app_images.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key,required this.product,required this.index}) : super(key: key);

  final Product product;
  final int index;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>{

  @override
  Widget build(BuildContext context) {
    final deviceSize =MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(ProductDetails.routeName,arguments: widget.product),
          child: Container(
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
                        Container(
                          margin: EdgeInsets.only(top: constrains.maxHeight * 0.4,left: constrains.maxWidth * 0.2435,right:  deviceSize.width * 0.09),
                          child:  Text(widget.product.title,maxLines: 2,style:  TextStyle(fontFamily: AppFonts.raleWaySemiBold,fontSize: 22.sp ) ,),
                        ),
                        const SizedBox(height: 7.44,),
                        Container(
                          margin: const EdgeInsets.only(top: 7.44),
                          child:  FittedBox(child: Text('From £${widget.product.price}',style: TextStyle(color: AppColors.scaffoldBackgroundColor,fontFamily: AppFonts.raleWayBold,fontSize: 14.sp),)),
                        ),
                         SizedBox(height: constrains.maxHeight * 0.034,)
                      ],
                    ),
                  );
                }
            ),
          ),
        ),
        LayoutBuilder(
            builder: (context, constraints) {
              return FadeInImage(
                height: constraints.maxHeight * 0.5176,
                width: constraints.maxWidth * 0.7307,
                placeholder: const AssetImage(AppImages.splashImg),
                image: NetworkImage(widget.product.image),
              );
            }
        )
      ],
    );
  }
}



