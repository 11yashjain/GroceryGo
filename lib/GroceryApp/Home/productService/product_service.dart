import 'dart:convert';


import 'package:Grocery_App/constants/Error_Handling.dart';
import 'package:Grocery_App/constants/utils.dart';
import 'package:Grocery_App/models/product.dart';
import 'package:Grocery_App/models/user.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



String uri = 'http://192.168.29.208:4000';

class ProductServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
   

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      
      print(token);
      if (token == null) {
       scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text('no token')));
        return;
      }
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );
      print('Product ID: ${product.id}');

      print('Response status: ${res.statusCode}'); // Debugging print statement
      print('Response body: ${res.body}'); // Debugging print statement
     
      httpErrorHandle(
        response: res,
        // ignore: use_build_context_synchronously
        context: context,
        onsucces: () { 
         
        
         
         },
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}