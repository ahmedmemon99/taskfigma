
abstract class ProductEvents{

}

class LoadingEvent extends ProductEvents{


}

class LoadedEvent extends ProductEvents{

}

class SingleProductEvent extends ProductEvents{

  SingleProductEvent({required this.id});

  final int id;

}

class SearchEvent extends ProductEvents{

}