import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:taskappfigma/Models/product.dart';
import 'package:taskappfigma/Screens/Home%20Screen/sample.dart';

import 'Product_item.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key,required this.list}) : super(key: key);

  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    final deviceHeight =MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top -MediaQuery.of(context).viewPadding.bottom;
    final deviceWidth =MediaQuery.of(context).size.width;
    return  GridView.custom(
      padding: EdgeInsets.only(left: deviceWidth * 0.0497),
      gridDelegate:
      SliverStairedGridDelegate(


          crossAxisSpacing: 30,
          mainAxisSpacing: 22,
          pattern: [
            const StairedGridTile(0.5,0.5 ),
            const StairedGridTile(0.5,0.5)
          ]),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: list.length,
              (context,index) =>  ProductItem(product: list[index], index: index)
      ),
    );
  }
}
