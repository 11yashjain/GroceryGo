part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

abstract class AuthActionState extends AuthState{}

final class AuthInitial extends AuthState {}

 final class NavigateToHomeScreenActionState extends AuthActionState{}

final class AuthenticatedState extends AuthState{
  final dynamic user;

  AuthenticatedState({required this.user});
}

final class UnauthenticatedState extends AuthState{}




