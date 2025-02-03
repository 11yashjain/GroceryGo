import 'package:Grocery_App/Data/dummy_data.dart';
import 'package:Grocery_App/GroceryApp/Home/Ui/Ui%20Components/HomeAndKitchen.dart';

import 'package:Grocery_App/GroceryApp/Home/Ui/Ui%20Components/topDeals.dart';
import 'package:flutter/material.dart';

class Technology extends StatelessWidget {
  const Technology({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
                 
            children: [ 
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                            'Top Deals',
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700),
                          ),
                  ),
                  
                ],
              ),
                  
                   Topdeals(data: techProductsData),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Home & Kitchen',
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                   HomeAndKitchen(data: technologyData,dataDetails: [],),
                   ],
                   ),
        ),
      ));
  }
}