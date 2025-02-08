
import 'package:Grocery_App/GroceryApp/Home/Ui/Home.dart';
import 'package:Grocery_App/GroceryApp/auth/authService/auth_service.dart';
import 'package:Grocery_App/GroceryApp/auth/bloc/auth_bloc.dart';
import 'package:Grocery_App/GroceryApp/auth/screens/authScreen.dart';
import 'package:Grocery_App/constants/utils.dart';

import 'package:Grocery_App/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  final AuthBloc authBloc = AuthBloc();
  


  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context, authBloc: authBloc);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authBloc,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => generateRoute(settings),
          scaffoldMessengerKey: scaffoldMessengerKey,
          home:  BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthenticatedState) {
                  
                  return const Home();
                } else if(state is UnauthenticatedState){
                  return const Authscreen();
                  }
                 else {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
    );
      
    
  }
}

