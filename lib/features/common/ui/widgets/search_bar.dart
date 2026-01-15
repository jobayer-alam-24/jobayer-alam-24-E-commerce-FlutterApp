import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key, required this.searchcontroller,
  });


  final TextEditingController searchcontroller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchcontroller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        fillColor: Colors.grey.shade200,
        hintText: 'Search',
        prefixIcon: Icon(Icons.search, color: Colors.grey,),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none
        ),
      ),
    );
  }
}
