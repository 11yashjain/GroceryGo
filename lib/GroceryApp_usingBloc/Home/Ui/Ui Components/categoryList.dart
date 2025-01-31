
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
   CategoryList({super.key});
  final List<Map<String, String>> categories = [
    {'name': 'Fruits', 'icon': '🍎'},
    {'name': 'Vegetables', 'icon': '🥕'},
    {'name': 'Dairy', 'icon': '🥛'},
    {'name': 'Bakery', 'icon': '🍞'},
    {'name':'tech','icon':'🎧'},
    
  ];

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Text(
                    categories[index]['icon']!,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(height: 8),
                Text(categories[index]['name']!),
              ],
            ),
          );
        },
      ),
    );
  }
}