import 'dart:convert';

import 'package:Grocery_App/constants/utils.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void httpErrorHandle(
 { required http.Response response,
  required BuildContext context,
  required VoidCallback onsucces,
  }
){
  switch(response.statusCode){
   case 200:
    onsucces();
    break;
   case 400:
   scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text(jsonDecode(response.body)['msg'])));
  
    break;
   case 500:
    scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text(jsonDecode(response.body)['error'])));
    
    break;
   default:
   scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text(response.body)));
     
  }
}