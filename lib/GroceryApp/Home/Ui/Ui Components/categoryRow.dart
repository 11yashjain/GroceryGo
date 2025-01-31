import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key, required this.data});
  final List<Map<String,dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: data.length,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection:Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context,index)=>
        
        Column(
         spacing: 8.0,
          children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  elevation: 2.0 ,
                  clipBehavior: Clip.hardEdge,
                child: Image.network(
                  data[index]['image'],fit: BoxFit.cover,height: 81,width: 81,),
                              ),
              ),
                            
                  Text(
                    data[index]['name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500),
                  ),
        ],
        ),
        ),
    );
  }
}