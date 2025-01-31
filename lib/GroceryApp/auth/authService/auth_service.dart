import 'dart:convert';

import 'package:animation_flutter/GroceryApp/auth/bloc/auth_bloc.dart';
import 'package:animation_flutter/constants/Error_Handling.dart';

import 'package:animation_flutter/constants/utils.dart';
import 'package:animation_flutter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


String uri = 'http://192.168.29.208:4000';
class AuthService{
  void signUpUser({
    required String email,
    required BuildContext context,
    required String password,
    required String name,
  }) async {
    try{
       User user = User(
        id: '', 
        name: name, 
        email: email,
        password: password, 
        address: '', 
        type: '', 
        token: '',
        );
    final response = await http.post(
      Uri.parse('$uri/api/signup'),
      headers: {'Content-Type':'application/json; charset=UTF-8'},
      body: user.toJson(),
      );

    
    httpErrorHandle(
      response: response, 
      // ignore: use_build_context_synchronously
      context: context, 
      onsucces: (){
       
       scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text('Account created! Login with same crediantials')));
    });

    }catch(e){  
       scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text(e.toString())));
        
    }
  }

  void signInUser({
    required String email,
    required BuildContext context,
    required String password,
    required AuthBloc authBloc,
  }) async {
    try{
    final response = await http.post(
      Uri.parse('$uri/api/signin'),
      headers: {'Content-Type':'application/json; charset=UTF-8'},
      body: jsonEncode({'email':email,'password':password}),
      );

   
    httpErrorHandle(
      response: response, 
      // ignore: use_build_context_synchronously
      context: context, 
      onsucces: () async{
        
          authBloc.add(AuthUserData(response: response.body));
         
    });

    }catch(e){
       scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text(e.toString())));
       
    }
  }
  
   void getUserData({
    required BuildContext context,
    required AuthBloc authBloc,
  }) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if(token == null || token.isEmpty){
       prefs.setString('x-auth-token', '');
       authBloc.add(AuthUnauthenticated());
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/isTokenValid'),
        headers: {
          'content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        }
      );
    
      var response = jsonDecode(tokenRes.body);
      if(response == true){
         http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: {
          'content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
          }
         );
        authBloc.add(AuthUserData(response: userRes.body));
        final userData = jsonDecode(userRes.body);
        //String userToken = userData['token'] ?? token;
        
        authBloc.add(AuthAuthenticated(user: userData)); 
        
        
      }else{
        authBloc.add(AuthUnauthenticated());
      }
    }catch(e){
      scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text(e.toString())));
     
       authBloc.add(AuthUnauthenticated());
    }
  }
}