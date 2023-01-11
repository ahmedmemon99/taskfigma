import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskappfigma/AppData/app_colors.dart';

import 'componets/product description.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  static const String routeName ='/productDetails';

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top -MediaQuery.of(context).viewPadding.bottom ;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.productDetailBgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: deviceHeight * 0.4386,
            ),
            const Expanded(
              child: ProductDescription()
            )
          ],
        ),

      ),
    );
  }
}
