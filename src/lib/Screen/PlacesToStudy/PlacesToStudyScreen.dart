import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyItems.dart';

import '../../Widgets/AppTitle.dart';
import 'PlacesToStudyRooms.dart';


class PlacesToStudyScreen extends StatefulWidget {
  @override
  PlacesToStudyScreenState createState() => PlacesToStudyScreenState();
}

class PlacesToStudyScreenState extends State<PlacesToStudyScreen> {

  @override
  Widget build(BuildContext context) {
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
                          "Places to Study",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Expanded(
                          child: SingleChildScrollView(
                            //physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                              horizontal: 25.0,
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
                                    itemCount: rooms.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      //crossAxisSpacing: 30.0,
                                      childAspectRatio: 1.5,
                                    ),
                                    itemBuilder: (context, index) => PlacesToStudyItems(room: rooms[index]),
                                  ),
                                ),
                              ],
                            )
                          ),
                        )
                      ]
                    )
                  )
                ]
              )
            )
        )
    );
  }
}