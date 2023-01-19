import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:taskappfigma/Models/product.dart';
import 'Product_item.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key,required this.list}) : super(key: key);
  final List<Product> list;
  @override
  Widget build(BuildContext context) {
    final deviceWidth =MediaQuery.of(context).size.width;
    return  GridView.custom(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
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
