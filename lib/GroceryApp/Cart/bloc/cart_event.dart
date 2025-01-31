part of 'cart_bloc.dart';

@immutable
abstract class CartBlocEvent {}

class CartInitalEvent extends CartBlocEvent {}

class CartRemoveFromCartEvent extends CartBlocEvent {
  final ProductDataModel productDataModel;

  CartRemoveFromCartEvent({required this.productDataModel});
}

class CartIncreaseInCartEvent extends CartBlocEvent {
  final ProductDataModel productDataModel;

  CartIncreaseInCartEvent({required this.productDataModel});
}
