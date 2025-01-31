import 'dart:async';
import 'dart:convert';

import 'package:animation_flutter/Data/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:animation_flutter/GroceryApp/Home/Models/Home_Product_data_Model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
    emit(CartLoadingState());
    cartlistItems.clear();
    print(cartlistItems);
    try {
      final url = Uri.https('flutter-grocery-oct15-default-rtdb.firebaseio.com',
          'shopping-list.json');
      final response = await http.get(url);

      if (response.body == 'null') {
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      //final List<ProductDataModel> listValues = [];
      listData.forEach(
        (key, value) {
          final productData = ProductDataModel(
            id: key,
            name: value["name"],
            description: value["description"],
            price: value["price"],
            imageUrl: value["imageUrl"],
            count: value["count"],
          );
          cartlistItems.add(productData);

          emit(CartSuccesState(cartItems: cartlistItems));
        },
      );
    } catch (error) {
      emit(CartCrashState());
    }
  }

  FutureOr<void> cartRemoveFromCartEvent(
    CartRemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final url = Uri.https('flutter-grocery-oct15-default-rtdb.firebaseio.com',
        'shopping-list/${event.productDataModel.id}.json');

    await http.delete(url);
    cartlistItems.remove(event.productDataModel);
    if (cartlistItems.isEmpty) {
      emit(CartEmptyState());
    } else {
      emit(CartSuccesState(cartItems: cartlistItems));
    }
  }

  FutureOr<void> cartIncreaseInCartEvent(
      CartIncreaseInCartEvent event, Emitter<CartState> emit) {
    print(event.productDataModel.count);

    final existingProductIndex = cartlistItems
        .indexWhere((product) => product.id == event.productDataModel.id);

    if (existingProductIndex != -1) {
      cartlistItems[existingProductIndex].count++;

      emit(CartSuccesState(cartItems: cartlistItems));

      print(cartlistItems);
    }
    emit(CartIncreaseActionState());
  }
}
