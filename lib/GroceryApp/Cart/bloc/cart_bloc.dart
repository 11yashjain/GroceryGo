import 'dart:async';

import 'package:Grocery_App/Data/cart.dart';
import 'package:flutter/material.dart';


import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Home/Models/Home_Product_data_Model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartBlocEvent, CartState> {
  CartBloc() : super(CartBlocInitial()) {
    on<CartInitalEvent>(cartInitalEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
    on<CartIncreaseInCartEvent>(cartIncreaseInCartEvent);
  }

  FutureOr<void> cartInitalEvent(
      CartInitalEvent event, Emitter<CartState> emit) async {
   
  }

  FutureOr<void> cartRemoveFromCartEvent(
    CartRemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
     cartItems.remove(event.productData);
     
  }

  FutureOr<void> cartIncreaseInCartEvent(
      CartIncreaseInCartEvent event, Emitter<CartState> emit) {
   
  }
}
