part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthInitialEvent extends AuthEvent{}

class AuthUserData extends AuthEvent{
    final String response;
  AuthUserData({required this.response});
}

class AuthAuthenticated extends AuthEvent{
  final dynamic user;
  AuthAuthenticated({required this.user});
}

class AuthUnauthenticated extends AuthEvent{
 
}

