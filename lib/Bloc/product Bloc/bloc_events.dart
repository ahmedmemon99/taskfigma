
abstract class ProductEvents{

}

class LoadingEvent extends ProductEvents{


}

class LoadedEvent extends ProductEvents{

}

class SearchEvent extends ProductEvents{

  SearchEvent({required this.searchKey});

  String searchKey;

}