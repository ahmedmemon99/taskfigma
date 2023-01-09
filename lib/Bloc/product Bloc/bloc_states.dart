import 'package:taskappfigma/Models/product.dart';

abstract class ProductStates{}


class LoadingState extends ProductStates{}

class LoadedState extends ProductStates{

  LoadedState({required this.list});

   final List<Product> list;
}