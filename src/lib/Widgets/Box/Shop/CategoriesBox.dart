import 'package:flutter/material.dart';

class CategoriesBox extends StatefulWidget{

  @override
  CategoriesBoxState createState() => CategoriesBoxState();
}

class CategoriesBoxState extends State<CategoriesBox>{

  List<String> categories = ["All ", "Drinks", "Snacks", "Meal"];
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategories(index),
      ),
    );
  }

  Widget buildCategories(int index){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
        categories[index],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )
      ),
    )
    );
  }



}