

import 'package:Grocery_App/Data/dummy_data.dart';
import 'package:flutter/material.dart';


class Insidecatogeries extends StatefulWidget {
  final List data;
  final String headerData;
  const Insidecatogeries({
    super.key,
    required this.data, required this.headerData,
   
  });

  @override
  State<Insidecatogeries> createState() => _InsidecatogeriesState();
}

class _InsidecatogeriesState extends State<Insidecatogeries> {
  

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
                //  _buildSidebar(),   In Progress
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
       
          return 
             Column(
              children: [
               
                SizedBox(height: 8),
                Text(
                  category['sideBarData']['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: category['isSelected'] ? Colors.green : Colors.grey[600],
                  ),
                ),
                
              ],
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

