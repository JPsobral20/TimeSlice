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
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title:Text(product.name),
                content: Text("Pretende comprar este produto?"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("Cancelar"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title:Text(product.name),
                          content: Text("Compra feita com sucesso!!!"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("Back"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text("Continuar"),
                  ),
                ],
              ),
            );
          },
          child: Container(
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
          product.price.toString() + "min",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}