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

  CartBloc({required this.productBloc}) : super(CartInitialState()){

    on<CartLoadedEvent>(onCartLoaded);
  }


  void onCartLoaded(CartLoadedEvent event,Emitter<CartState> emit)async{
    List<Product> productList =[ ];
    emit(CartLoadingState());
    Cart? cart = await CartRepository.getCart(event.userid);
    if(productBloc.state is LoadedState){
      productList =productBloc.state.list;
    }
    emit(CartLoadedState(cart: cart!,listOfProducts: cart.products,productList: productList));
  }
}