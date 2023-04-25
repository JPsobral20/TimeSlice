import 'package:flutter/material.dart';
import 'package:projeto/Screen/Shop/ShopProducts.dart';

class ShopItems extends StatelessWidget {
  final ShopProduct product;

  const ShopItems({
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
            height: 120,
            width: 160,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(product.image),
          ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            product.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          product.price.toString() + "h",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}