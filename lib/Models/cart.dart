import 'package:flutter/foundation.dart';

class Cart {
  int id;
  int userId;
  List<Products> products;

  Cart({
    required this.id,
    required this.userId,
    required this.products
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        id: json['id'],
        userId: json['userId'],
        products: json['products'] != null ? json['products'].map<Products>((e)=> Products.fromJson(e)).toList(): []);
  }
}


class Products {
  int? productId;
  int? quantity;

  Products({this.productId, this.quantity});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int
    );

  }

}