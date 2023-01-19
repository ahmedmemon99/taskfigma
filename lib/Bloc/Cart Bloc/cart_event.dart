abstract class CartEvent{


}

class CartLoadedEvent extends CartEvent{

  final int userid;

  CartLoadedEvent({required this.userid});


}