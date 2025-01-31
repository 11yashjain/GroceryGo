part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeBlocInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccesState extends HomeState {}

class HomeLoadingErrorState extends HomeState {}

class HomeNavigateToProfileActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}


