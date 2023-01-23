import 'package:taskappfigma/Models/cart.dart';

import '../../Models/product.dart';

abstract class CartState{}


class CartInitialState extends CartState{



}

class CartLoadedState extends CartState{

  CartLoadedState({required this.cart,required this.listOfProducts,required this.productList,required this.total});

  Cart cart;
  List<Products> listOfProducts;
  List<Product> productList;
  final double total;
}

class CartLoadingState extends CartState{

}

class CartTotalState extends CartState{

  CartTotalState({required this.total});
  final double total;


}

class CartTotalLoadingState extends CartState{


}