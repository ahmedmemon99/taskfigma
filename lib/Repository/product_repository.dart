import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:taskappfigma/AppData/Apiurl.dart';
import 'package:taskappfigma/Models/product.dart';

class ProductRepository{

  static Future<List<Product>> getProducts() async{
    try {

        http.Response response = await http.get(Uri.parse(ApiUrl.products));
        var data =json.decode(response.body) as List;
        return data.map<Product>((e) => Product.fromJson(e)).toList();

    }catch(e){
       log('f dsdsdssdd' + e.toString());
       return [];
     }
  }
}