import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/Screens/Product%20Details/componets/product_image_header.dart';

import '../../Models/product.dart';
import 'componets/product description.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key,}) : super(key: key);

  static const String routeName ='/productDetails';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final deviceHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top -MediaQuery.of(context).viewPadding.bottom ;
    return Scaffold(
      backgroundColor: AppColors.productDetailBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          ProductImageHeader(url: product.image,),
           Expanded(
            child: ProductDescription(
              title: product.title,
              description: product.description,
              rate: product.price,
            )
          )
        ],
      ),

    );
  }
}
