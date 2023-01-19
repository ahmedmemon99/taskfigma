import 'package:taskappfigma/Models/cart.dart';

import '../../Models/product.dart';

abstract class CartState{}


class CartInitialState extends CartState{



}

class CartLoadedState extends CartState{

  CartLoadedState({required this.cart,required this.listOfProducts,required this.productList});

  Cart cart;
  List<Products> listOfProducts;
  List<Product> productList;
}

class CartLoadingState extends CartState{

}