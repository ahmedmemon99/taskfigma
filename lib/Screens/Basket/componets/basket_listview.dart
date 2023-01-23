import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/Bloc/Cart%20Bloc/cart_bloc.dart';
import 'package:taskappfigma/Bloc/Cart%20Bloc/cart_state.dart';
import 'package:taskappfigma/Models/cart.dart';
import 'package:taskappfigma/Screens/Basket/componets/loading_basketitem.dart';
import 'basketItem.dart';

class BasketListView extends StatelessWidget {
  const BasketListView({
    Key? key,
    required this.deviceHeight,
  }) : super(key: key);

  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: deviceHeight * 0.0134,),
      height: deviceHeight * 0.55,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
           if(state is CartLoadingState){
             return ListView(

                 physics: const NeverScrollableScrollPhysics(),
                 padding: EdgeInsets.zero,
                 children: List.generate(5, (index) => const LoadingBasketItem())
             );
           }
           if(state is CartLoadedState){
             return ListView.builder(
                 physics: const BouncingScrollPhysics(),
                 padding: EdgeInsets.zero,
                 itemCount: state.listOfProducts.length,
                 itemBuilder: (BuildContext context, int index) {
                   return BasketItem(productId: state.listOfProducts[index].productId!, quantity: state.listOfProducts[index].quantity!, productList: state.productList);
                 },
             );
           }
              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: List.generate(5, (index) => const LoadingBasketItem())
              );
        },
      ),
    );
  }
}