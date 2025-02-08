
import 'package:Grocery_App/Data/cart.dart';
import 'package:Grocery_App/GroceryApp/Home/bloc/home_bloc.dart';
import 'package:Grocery_App/GroceryApp/Home/productService/product_service.dart';
import 'package:Grocery_App/models/product.dart';
import 'package:flutter/material.dart';

class FeaturedItems extends StatelessWidget {
  

   const FeaturedItems({super.key, required this.data, required this.homeBloc});
   
   final List<Map<String, dynamic>> data;
   final HomeBloc homeBloc;
   
 
  @override
  Widget build(BuildContext context) {
   
    
    return GridView.builder(
     shrinkWrap: true,
     physics: NeverScrollableScrollPhysics(),
     scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        
        return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Card(
                    elevation: 3.0,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Image.network(
                      data[index]['image'],
                      fit: BoxFit.cover,
                      height: 110,
                      width: 110,
                    
                    ),
                  ),
                  Positioned(
                  right: 0.5,
                   
                top: 81,
                width: 55.0,
                height: 35.0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                          
                        ),
                      ),
                      onPressed: () {
                       homeBloc.add(HomeToCartEvent(data: data[index]));
                      
                       print(cartItems);
                       
                      },
                      child: const Text('ADD'),
                    ),
                  ),
                ],
              ),
               Center(child: Text(data[index]['name'])),
              Center(child: Text(data[index]['price'])),
            ],
        );
      },
    );
  }
}