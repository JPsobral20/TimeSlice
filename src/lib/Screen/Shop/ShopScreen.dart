import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/Shop/Box/TimeToSpendBox.dart';
import 'package:projeto/Screen/Shop/ShopItems.dart';
import 'package:projeto/Screen/Shop/ShopProducts.dart';
import '../../Widgets/AppTitle.dart';

class ShopScreen extends StatefulWidget{
  const ShopScreen({super.key});

  @override
  ShopScreenState createState() => ShopScreenState();
}

class ShopScreenState extends State<ShopScreen>{

  late Future<int> futureCurrTime;

  Future<int> setCurrTime() async{
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uid).get();
    String id = snapshot.docs.first.id;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(id).get();
    return userDoc.get('currTime');
  }

  @override
  void initState() {
    super.initState();
    futureCurrTime = setCurrTime();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value:SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                FutureBuilder(future: futureCurrTime, initialData: null, builder: (ctx, snapshot) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Color(0xfff3e5f5),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20.0,
                              )
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: AppTitle(size: 42),
                          ),
                          SizedBox(height: 20.0),
                          Align(
                            alignment: Alignment.topLeft,
                            child: TimeToSpendBox(currTime: snapshot.data ?? 0),
                          ),
                          SizedBox(height: 13.0),
                          Text(
                            "Shop",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Expanded(
                            child: SingleChildScrollView(
                              //physics: AlwaysScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 7.0),
                                      child: GridView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: products.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 30.0,
                                          childAspectRatio: 0.82,
                                        ),
                                        itemBuilder: (context, index) =>
                                            ShopItems(product: products[index],
                                                currTime: snapshot.data ?? 0),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          )
                        ],
                      ),
                    )
                  );
                })
              ]
            )
          )
        )
    );
  }
}