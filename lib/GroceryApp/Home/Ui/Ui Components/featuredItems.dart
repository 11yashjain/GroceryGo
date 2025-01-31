
import 'package:flutter/material.dart';

class FeaturedItems extends StatelessWidget {
  

   const FeaturedItems({super.key, required this.data});
   final List<Map<String, dynamic>> data;

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
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Stack(
              children:[ 
                Card(
                  elevation: 2.0,
                  clipBehavior: Clip.hardEdge,
                child: Image.network(data[index]['image'],height: 90,width: 90,fit: BoxFit.cover,),
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
                  data[index]['name'],
                  style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500),
                ),
                Text(
                  '${data[index]['price']}',
                 
                ),
                
               
              ],
        );
      },
    );
  }
}