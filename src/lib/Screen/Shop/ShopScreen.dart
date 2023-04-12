import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/Shop/Items.dart';
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

                        const Align(
                          alignment: Alignment.topRight,
                          child: AppTitle(size: 42),
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                            "Shop",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                        const SizedBox(height: 10.0),
                        CategoriesBox(),
                        
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.0),
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: products.length,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              childAspectRatio: 0.8,
                            ),
                            itemBuilder: (context, index) => Items(product: products[index]),
                          ),
                        ),
                        
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