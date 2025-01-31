import 'package:animation_flutter/Data/dummy_data.dart';

import 'package:animation_flutter/GroceryApp_usingBloc/Home/Ui/Ui%20Components/categoryRow.dart';


import 'package:animation_flutter/GroceryApp_usingBloc/Home/Ui/Ui%20Components/topRated.dart';
import 'package:flutter/material.dart';

class Beauty extends StatelessWidget {
  const Beauty({super.key});

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
                            'Top Rated',
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700),
                          ),
                  ),
                  
                ],
              ),
                  
                   TopRated(data: beautyTopRated),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Makeup & cosmetics',
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                   CategoryRow(data: makeupData),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Tools & accessories',
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                   CategoryRow(data: toolsData),
                   ],
                   
                   ),
        ),
      ));
  }
}