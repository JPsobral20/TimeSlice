import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/Shop/ShopItems.dart';
import 'package:projeto/Screen/Shop/ShopProducts.dart';
import 'package:projeto/Screen/Shop/Box/CategoriesBox.dart';
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
                        Text(
                          "Shop",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        CategoriesBox(),
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
                                    padding: EdgeInsets.symmetric(horizontal: 7.0),
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
                                      itemBuilder: (context, index) => ShopItems(product: products[index]),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        )
                      ],
                    ),
                  )
                )
              ]
            )
          )
        )
    );
  }
}