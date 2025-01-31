

import 'package:flutter/material.dart';


class Insidecatogeries extends StatefulWidget {
  final List data;
  final String headerData;
  Insidecatogeries({
    super.key,
    required this.data, required this.headerData,
   
  });

  @override
  State<Insidecatogeries> createState() => _InsidecatogeriesState();
}

class _InsidecatogeriesState extends State<Insidecatogeries> {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Extension\nCables',
      'icon': 'assets/extension.png',
      'isSelected': true,
    },
    {
      'name': 'Batteries',
      'icon': 'assets/batteries.png',
      'isSelected': false,
    },
    {
      'name': 'Electrical\nAccessories',
      'icon': 'assets/electrical.png',
      'isSelected': false,
    },
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Goldmedal Twister 2-Pin Extension Reel (5 m, White & Red)',
      'image': 'assets/extension1.png',
      'rating': 4.5,
      'reviews': 20,
      'originalPrice': 497,
      'discountedPrice': 239,
      'discount': '51% OFF',
      'deliveryTime': '8 MINS',
      'specs': ['2 Pin, 3 Pin', '5 mtrs'],
      'tag': 'Bestseller',
    },
    {
      'name': 'Ant Esports PS330 Extension Board',
      'image': 'assets/extension2.png',
      'rating': 4.0,
      'reviews': 79,
      'originalPrice': 1499,
      'discountedPrice': 429,
      'discount': '71% OFF',
      'deliveryTime': '8 MINS',
      'specs': [],
    },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: Row(
                children: [
                  _buildSidebar(),
                  Expanded(
                    child: Column(
                      children: [
                        _buildFilters(),
                        Expanded(
                          child: _buildProductGrid(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Text(
                widget.headerData ,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: category['isSelected'] ? Colors.green : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.electrical_services),
                ),
                SizedBox(height: 8),
                Text(
                  category['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: category['isSelected'] ? Colors.green : Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        spacing: 9.0,
        children: [
          _buildFilterButton('Filters', Icons.tune_rounded,),
         
          _buildFilterButton('Sort', Icons.sort,),
         
        
          
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, IconData icon,) {
    return 
       ElevatedButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
           
            builder: (BuildContext context){
               // ignore: sized_box_for_whitespace
               return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                //color: Colors.white,
               
                );
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
         
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
          
        ),
         child: 
            Row(
             children: [
              Icon(icon,size: 20.0,color: Colors.black,),
              Text(text,style: TextStyle(color: Colors.black),),
               Icon(Icons.arrow_drop_down,color: Colors.black,),
             ],
           ),
       );
    
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
       
      ),
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
       
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 2,
          children: [
            Stack(
              children:[ 
                Card(
                  elevation: 2.0,
                  clipBehavior: Clip.hardEdge,
                child: Image.network(widget.data[index]['image'],height: 90,width: 90,fit: BoxFit.cover,),
              ),
              Positioned(
                right: 0.1,
                top: 0.1,
                width: 25.0,
                height: 5.0,
               
                
                child: IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.add_box_rounded),
                  iconSize: 33.0,
                ),
                ),
              ],
            ),  
                Text(
                  widget.data[index]['name'],
                  style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500),
                ),
                Text(
                  widget.data[index]['price'],
                 
                ),
                
               
              ],
        );
      },
    );
  }
}

/* 
Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey[300]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product['tag'] != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    product['tag'],
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    product['image'],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product['specs'].isNotEmpty)
                      Wrap(
                        spacing: 8,
                        children: product['specs']
                            .map<Widget>((spec) => Text(
                                  spec,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ))
                            .toList(),
                      ),
                    SizedBox(height: 4),
                    Text(
                      product['name'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            index < product['rating']
                                ? Icons.star
                                : Icons.star_border,
                            size: 16,
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '(${product['reviews']})',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          product['deliveryTime'],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '₹${product['discountedPrice']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'MRP ₹${product['originalPrice']}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                         
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('ADD'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
*/ 