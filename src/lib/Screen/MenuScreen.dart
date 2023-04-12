import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Widgets/Buttons/Menu/PlacesToStudyButton.dart';
import 'package:projeto/Widgets/Buttons/Menu/Schoolarship.dart';
import 'package:projeto/Widgets/Buttons/Menu/ShopButton.dart';
import 'package:projeto/Widgets/Buttons/Menu/TimerButton.dart';
import 'package:projeto/Widgets/Buttons/Menu/TrackerButton.dart';

class MenuScreen extends StatefulWidget {
  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Menu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 50.0,),
                        TimerButton(),
                        PlacesToStudyButton(),
                        ShopButton(),
                        TrackerButton(),
                        SchoolarshipButton(),
                      ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        )
    );
    }
}