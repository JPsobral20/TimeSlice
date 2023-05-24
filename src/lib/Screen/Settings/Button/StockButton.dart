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
    if (products == "") return "No products";
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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 60,
      child: FutureBuilder(future: futureProducts, initialData: null, builder: (ctx, snapshot) {
        return ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("My Stock"),
                content: Text(snapshot.data ?? "No products"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Back"),
                  ),
                ],
              ),
            );
          },

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "See My Stock",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
          )
        );
      })
    );
  }
}