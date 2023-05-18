import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StockButton extends StatefulWidget{
  const StockButton({super.key});

  @override
  StockButtonState createState() => StockButtonState();
}

class StockButtonState extends State<StockButton> {

  late Future<String> futureProducts;

  Future<String> setProducts() async{
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uid).get();
    String id = snapshot.docs.first.id;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(id).get();
    var userProducts = userDoc.get('products');
    String products = userProducts.join("\n");
    if (products == "") return "Sem produtos";
    return products;
  }

  @override
  void initState() {
    super.initState();
    futureProducts = setProducts();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      child: FutureBuilder(future: futureProducts, initialData: null, builder: (ctx, snapshot) {
        return ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Stock"),
                content: Text(snapshot.data ?? "Sem Produtos"),
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

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Stock",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        );
      })
    );
  }
}