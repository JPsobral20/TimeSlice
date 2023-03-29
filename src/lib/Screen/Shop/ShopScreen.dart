import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/Shop/Products.dart';
import 'package:projeto/Widgets/Box/Shop/CategoriesBox.dart';

import '../../Widgets/AppTitle.dart';

class ShopScreen extends StatefulWidget{
  @override
  ShopScreenState createState() => ShopScreenState();
}

class ShopScreenState extends State<ShopScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value:SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffffc58d),
                        Color(0xccffc58d),
                        Color(0x99ffc58d),
                        Color(0x66ffc58d),
                        Color(0x33ffc58d),
                      ]
                    )
                  ),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 70.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: AppTitle(),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                            "Shop",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                        SizedBox(height: 10.0),
                        CategoriesBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20.0),
                              height: 180,
                              width: 160,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset(products[0].image),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0.3),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            products[0].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          products[0].price.toString() + "h",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  )
                )
              ]
            )
          )
        )
    );
  }
}