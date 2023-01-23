import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/Bloc/Cart%20Bloc/cart_event.dart';
import 'package:taskappfigma/Bloc/Cart%20Bloc/cart_state.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc_states.dart';
import 'package:taskappfigma/Models/product.dart';
import 'package:taskappfigma/Repository/cart_repository.dart';

import '../../Models/cart.dart';
import '../product Bloc/bloc.dart';


class CartBloc extends Bloc<CartEvent,CartState>{

  ProductBloc productBloc;
  double total =0;
  int cartListLength =0;


  CartBloc({required this.productBloc}) : super(CartInitialState()){

    on<CartLoadedEvent>(_onCartLoaded);
  }


  void _onCartLoaded(CartLoadedEvent event,Emitter<CartState> emit)async{

    List<Product> productList =[ ];
    List<Map<String,dynamic>>forCartTotal =[];

    emit(CartLoadingState());
    total = 0;

    Cart? cart = await CartRepository.getCart(event.userid);
    if(productBloc.state is LoadedState){
      productList =productBloc.state.list;
    }
      emit(CartLoadedState(cart: cart!,listOfProducts: cart.products,productList: productList,total: total));
      cartListLength = cart.products.length;

      for(var id in cart.products){
        Product price = productList.firstWhere((element) => element.id == id.productId);
        forCartTotal.add({'price': price.price,'quantity': id.quantity });
      }

      for(var item in forCartTotal){
        total += item['price'] * item['quantity'];
      }

  }


  
  
}