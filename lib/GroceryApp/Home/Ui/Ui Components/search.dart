
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchBarState();
}

class _SearchBarState extends State<Search> {
   final TextEditingController _searchController = TextEditingController();
    
    @override
    void dispose(){
     super.dispose();
     _searchController.dispose();
    }




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
         
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search for groceries...',
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            border: OutlineInputBorder(
             // borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none
            ),
          ),
        ),
      ),
    );
  }
}