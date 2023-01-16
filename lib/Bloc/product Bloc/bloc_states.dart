import 'package:taskappfigma/Models/product.dart';

abstract class ProductStates{

  ProductStates({required this.list});

  List<Product> list;
}


class LoadingState extends ProductStates{
  LoadingState({required super.list});
}

class LoadedState extends ProductStates{

   LoadedState({required List<Product> list}) : super(list: list);

}

class SearchState extends ProductStates{

  SearchState({required super.list,required this.filteredList});

  final List<Product> filteredList;

}
class ItemNotFoundState extends ProductStates{
  ItemNotFoundState({required super.list});


}