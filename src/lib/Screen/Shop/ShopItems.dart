import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto/Screen/Shop/ShopProducts.dart';


class ShopItems extends StatefulWidget{
  ShopProduct product;
  int currTime;

  ShopItems({
    required this.product,
    required this.currTime,
    super.key,
  });

  @override
  ShopItemsState createState() => ShopItemsState();
}

class ShopItemsState extends State<ShopItems>{


  UpdateCurrTime(ShopProduct product) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uid).get();
    String id = snapshot.docs.first.id;
    setState((){
      FirebaseFirestore.instance.collection('Users').doc(id).update({'currTime': widget.currTime - product.price});
    });
  }

  UpdateProducts(String product) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uid).get();
    String id = snapshot.docs.first.id;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(id).get();
    var userProducts = userDoc.get('products');
    setState((){
      userProducts.add(product);
      FirebaseFirestore.instance.collection('Users').doc(id).update({'products': userProducts});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () async{
            if (widget.currTime >= widget.product.price) {
              showDialog(
                context: context,
                builder: (ctx) =>
                    AlertDialog(
                      title: Text(widget.product.name),
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
                              builder: (ctx) =>
                                  AlertDialog(
                                    title: Text(widget.product.name),
                                    content: Text(
                                        "Compra feita com sucesso!!!"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          UpdateCurrTime(widget.product);
                                          UpdateProducts(widget.product.name);
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Text("Back"),
                                      ),
                                    ],
                                  ),
                            );
                          },
                          child: Text("Sim"),
                        ),
                      ],
                    ),
              );
            }
            else{
              showDialog(
                context: context,
                builder: (ctx) =>
                    AlertDialog(
                      title: Text(widget.product.name),
                      content: Text(
                          "Não tem dinheiro suficiente para comprar este produto!"),
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
            }
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
            child: Image.asset(widget.product.image),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            widget.product.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          widget.product.price.toString(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}