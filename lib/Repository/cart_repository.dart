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
           var data =json.decode(response.body) as List<Map>;
           var list = data.map((e) => null).toList()
           return data.first;
         }
    }catch(e){
      print('entered here');
      log(e.toString());
    }
    return null;

    
    



  }


}