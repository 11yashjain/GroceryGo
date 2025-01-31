

import 'package:animation_flutter/GroceryApp/Home/Ui/Home.dart';
import 'package:animation_flutter/GroceryApp/Profile/Profile.dart';
import 'package:animation_flutter/GroceryApp/auth/screens/authScreen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case Authscreen.routename:
       return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>const Authscreen(),
      );
    case Home.routename:
       return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>const Home(),
      );
    case ProfileScreen.routename:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>const ProfileScreen(),
          );

     default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> const Scaffold(body: Center(child: Text("Screen doesn't exists"),),)
        );
  }
}