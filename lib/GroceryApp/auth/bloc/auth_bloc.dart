import 'dart:async';

import 'package:animation_flutter/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthUserData>(authUserData);
    on<AuthUnauthenticated>(authUnauthenticated);
    on<AuthAuthenticated>(authAuthenticated);
  }

  FutureOr<void> authUserData(AuthUserData event, Emitter<AuthState> emit) async {
     
      User user = User(
        id: '', 
        name: '', 
        email: '',   
        password: '', 
        address: '', 
        type: '', 
        token: '',
        );  
      
      user = User.fromJson(event.response);
      
      SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('x-auth-token', user.token);
      //emit(NavigateToHomeScreenActionState());
      //emit(AuthenticatedState());
  }

   FutureOr<void> authAuthenticated(AuthAuthenticated event, Emitter<AuthState> emit) {
    if(event.user['token'] != null){
     // print(event.user['name']);
    emit(AuthenticatedState(user: event.user));
   // emit(NavigateToHomeScreenActionState());
    }
    else{
      emit(UnauthenticatedState());
    }
    
  }

  FutureOr<void> authUnauthenticated(AuthUnauthenticated event, Emitter<AuthState> emit) {
    emit(UnauthenticatedState());
  }

}
