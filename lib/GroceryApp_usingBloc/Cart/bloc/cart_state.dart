part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

final class CartBlocInitial extends CartState {}

class CartSuccesState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccesState({required this.cartItems});
}

class CartCrashState extends CartState {}

class CartLoadingState extends CartState {}

class CartEmptyState extends CartState {}

class CartProductRemoveActionState extends CartActionState {}

class CartIncreaseActionState extends CartActionState {}
