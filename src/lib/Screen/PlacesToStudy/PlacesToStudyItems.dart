import 'package:flutter/material.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyProducts.dart';

class PlacesToStudyItems extends StatelessWidget {
  final PlacesToStudyProduct product;
  //final Function press;

  const PlacesToStudyItems({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(product.name),
              Text(product.description),
            ],
          )
        ),
      ],
    );
  }
}