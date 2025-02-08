part of 'home_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class HomeInitalEvent extends HomeBlocEvent {}




class HomeToCartEvent extends HomeBlocEvent{
  final dynamic data;

  HomeToCartEvent({required this.data});
}
class HomeCartBottomSheetEvent extends HomeBlocEvent{}

class HomeProfileNavigateEvent extends HomeBlocEvent {}
class HomeCartButtonNavigateEvent extends HomeBlocEvent {}
