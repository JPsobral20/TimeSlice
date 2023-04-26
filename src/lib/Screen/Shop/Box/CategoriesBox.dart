import 'package:flutter/material.dart';

class CategoriesBox extends StatefulWidget{
  const CategoriesBox({super.key});

  @override
  CategoriesBoxState createState() => CategoriesBoxState();
}

class CategoriesBoxState extends State<CategoriesBox>{

  List<String> categories = ["All", "Drinks", "Snacks", "Meals"];
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategories(index),
        ),
      ),
    );
  }

  Widget buildCategories(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          isSelected = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text(
            categories[index],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected == index ? Colors.black : Color(0x77000000),
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 2,
            width: categories[isSelected].length * 3.0,
            color: isSelected == index ? Colors.black : Colors.transparent,
          )
          ]
        )
      ),
    );
  }



}