import 'package:animation_flutter/GroceryApp_usingBloc/Cart/bloc/cart_bloc.dart';
import 'package:animation_flutter/GroceryApp_usingBloc/Home/Models/Home_Product_data_Model.dart';

import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        productDataModel.imageUrl,
                      ))),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productDataModel.description,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  "\$ " "${productDataModel.price}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cartBloc.add(CartRemoveFromCartEvent(
                          productDataModel: productDataModel));
                    },
                    icon: const Icon(Icons.remove_circle_outline_sharp),
                  ),
                  Text(productDataModel.count.toString()),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartIncreaseInCartEvent(
                          productDataModel: productDataModel,
                        ));
                      },
                      icon: const Icon(Icons.add_circle_outline_sharp)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          //   homebloc.add(HomeProductWishlistButtonClickedEvent(
                          //     clickedProduct: productDataModel));
                        },
                        icon: const Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          cartBloc.add(CartRemoveFromCartEvent(
                              productDataModel: productDataModel));
                        },
                        icon: const Icon(Icons.remove_shopping_cart_outlined)),
                  ],
                ),*/
