import 'package:taskappfigma/Models/product.dart';

abstract class ProductStates{}


class LoadingState extends ProductStates{}

class LoadedState extends ProductStates{

  LoadedState({required this.list});

   final List<Product> list;
}

class SearchState extends ProductStates{

  SearchState({required this.list});

  final List<Product> list;

}
class ItemNotFoundState extends ProductStates{


}