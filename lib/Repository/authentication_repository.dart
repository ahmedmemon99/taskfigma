import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:taskappfigma/AppData/Apiurl.dart';
import 'dart:convert';


class Authentication{

    static Future<int?> userLogin(String email,String password)async{
        Map<String,dynamic> body = {
            'email': email,
            'username':'ahmed',
            'password':password,
            'name':{
              'firstname':'John',
              'lastname':'Doe'
            },
            'address':{
              'city':'kilocycle',
              'street':'7835 new road',
              'number':3,
              'zipcode':'12926-3874',
              'geolocation':{
                'lat':'-37.3159',
                'long':'81.1496'
              }
            },
            'phone':'1-570-236-7033'
        };

        try {
            http.Response response = await http.post(Uri.parse(ApiUrl.loginUrl), body:json.encode(body));
            if(response.statusCode ==200){
               return json.decode(response.body)['id'];
            }
         }catch(e){

          log(e.toString());
         }
         return null;
       }
}

class AuthException implements Exception{
  final String error;

  AuthException({required this.error});

  @override
  String toString() {
    return error;
  }
}
