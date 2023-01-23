import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:taskappfigma/AppData/Apiurl.dart';

import '../Models/cart.dart';

class CartRepository{

  static Future<Cart?> getCart(id)async{
    try {
         http.Response response = await http.get(Uri.parse('${ApiUrl.userCartUrl}/$id'));
         if (response.statusCode == 200) {
           var data =json.decode(response.body) as List;
           var list = data.map<Cart>((e) => Cart.fromJson(e)).toList();
           return list.first;
         }
    }catch(e){
      log(e.toString());
    }
    return null;

    
    



  }


}