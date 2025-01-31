import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class Topdeals extends StatelessWidget {
  const Topdeals({super.key, required this.data});
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Card(
                    elevation: 3.0,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
                      data[index]['image'],
                      fit: BoxFit.cover,
                      height: 140,
                      width: 140,
                    
                    ),
                  ),
                  Positioned(
                  right: 0.5,
                   
                top: 110,
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
                      onPressed: () {},
                      child: const Text('ADD'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 150,
                child: Text(
                  data[index]['description'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              StarRating(
                starCount: 5,
                rating: 4,
                size: 20,
                onRatingChanged: (rating) {},
              ),
              Text(
                data[index]['price'].toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
