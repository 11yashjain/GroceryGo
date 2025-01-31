import 'package:animation_flutter/Data/dummy_data.dart';

import 'package:animation_flutter/GroceryApp_usingBloc/Home/Ui/Ui%20Components/featuredItems.dart';
import 'package:animation_flutter/GroceryApp_usingBloc/Home/Ui/Ui%20Components/HomeAndKitchen.dart';
import 'package:flutter/material.dart';

class Fruitsandvegetables extends StatelessWidget {
  const Fruitsandvegetables({super.key});

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
                            'Featured Items',
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700),
                          ),
                  ),
                  
                ],
              ),
                  
                   FeaturedItems(data: featuredData),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Grocery & Kitchen',
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                   HomeAndKitchen(data: fruitsData,dataDetails: [],),
            ],
                   ),
        ),
      ));
  }
}