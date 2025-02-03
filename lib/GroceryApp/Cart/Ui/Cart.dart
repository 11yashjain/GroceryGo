

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import 'cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitalEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Cart Items"),
        backgroundColor: const Color.fromARGB(243, 251, 251, 251),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartProductRemoveActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Product Removed'),
                duration: Duration(seconds: 1),
              ),
            );
          }
          if (state is CartIncreaseActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Product Repeated'),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadingState:
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            case CartSuccesState:
              final succesState = state as CartSuccesState;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: succesState.cartItems.length,
                      itemBuilder: (context, index) => CartTileWidget(
                        cartBloc: cartBloc,
                        productDataModel: succesState.cartItems[index],
                      ),
                    ),
                  ),
                 
                ],
              );

            case CartCrashState :
              return const Center(
                  child: Text(
                "Something went Wrong, Please Try Again !",
                style: TextStyle(color: Colors.black),
              ));
            case CartEmptyState:
              return const Center(
                  child: Text(
                "Please add something !",
                style: TextStyle(color: Colors.black),
              ));
            default:
              return const Text('');
          }
        },
      ),
    );
  }
}


