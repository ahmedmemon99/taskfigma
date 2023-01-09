import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc_events.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc_states.dart';
import 'package:taskappfigma/Models/product.dart';
import 'package:taskappfigma/Repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvents,ProductStates>{


  ProductBloc() : super(LoadingState()){

    on<LoadingEvent>(onLoading);
    on<LoadedEvent>(onLoaded);

  }

  void onLoading(LoadingEvent event, Emitter<ProductStates> emit){
     emit(LoadingState());
    }
  void onLoaded(LoadedEvent event, Emitter<ProductStates> emit)async{
    emit(LoadingState());
    List<Product> list = await ProductRepository.getProducts();
    emit(LoadedState(list: list));
  }



}