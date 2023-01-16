import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc_events.dart';
import 'package:taskappfigma/Bloc/product%20Bloc/bloc_states.dart';
import 'package:taskappfigma/Models/product.dart';
import 'package:taskappfigma/Repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvents,ProductStates>{

  List<Product>? _productList;

  ProductBloc() : super(LoadingState(list: [])){
    on<LoadingEvent>(onLoading);
    on<LoadedEvent>(onLoaded);
    on<SearchEvent>(onSearch);
  }

  void onLoading(LoadingEvent event, Emitter<ProductStates> emit){
     emit(LoadingState(list: []));
    }
    
  void onLoaded(LoadedEvent event, Emitter<ProductStates> emit)async{
    emit(LoadingState(list: []));
    List<Product> list = await ProductRepository.getProducts();
    _productList =list;
    emit(LoadedState(list: list));

  }

  void onSearch(SearchEvent event, Emitter<ProductStates> emit){
    if(event.searchKey.isNotEmpty){
      List<Product> filterList = _productList!.where((element) => element.title.startsWith(event.searchKey)).toList();
      if(filterList.isEmpty){
        emit(ItemNotFoundState(list: []));
      }else{
        emit(SearchState(list: _productList!, filteredList: filterList.isEmpty ? _productList!:filterList));
      }

    }else if(event.searchKey.isEmpty){
      print('entered ${state.list}');
      emit(LoadedState(list: _productList!));
    }
  }

}