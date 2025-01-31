

import 'package:animation_flutter/GroceryApp_usingBloc/Home/Ui/screens/insideCatogeries.dart';
import 'package:flutter/material.dart';

class HomeAndKitchen extends StatelessWidget {
 
   const HomeAndKitchen({super.key, required this.data, required this.dataDetails});
   final List<Map<String,dynamic>> data;
   final List dataDetails;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
     physics: NeverScrollableScrollPhysics(),
     scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx)=>
                  Insidecatogeries(
                    data: dataDetails[index]['data'],
                    headerData: data[index]['name'],
                )));
                 print(data[index]['name']);
              },
              child: Card(
                elevation: 2.0 ,
                clipBehavior: Clip.hardEdge,
              child: Image.network(data[index]['image'],fit: BoxFit.cover,height: 100,width: 100,),
                            ),
            ),
                          
                Text(
                  data[index]['name'],
                  style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500),
                ),
              
                
               
              ],
        );
      },
    );
  }
}