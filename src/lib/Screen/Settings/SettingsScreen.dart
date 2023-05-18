import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Screen/Settings/Box/SoundBox.dart';
import 'package:projeto/Screen/Settings/Box/VibrateBox.dart';
import 'package:projeto/Screen/Settings/Button/LogoutButton.dart';
import 'package:projeto/Screen/Settings/Button/StockButton.dart';
import '../../Widgets/AppTitle.dart';

class SettingsScreen extends StatefulWidget{
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
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
                        child: Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: AppTitle(size: 42),
                        ),
                      ),
                      SizedBox(height: 60.0),
                      Text(
                        "Settings",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 75.0),
                      StockButton(),
                      SizedBox(height: 50),
                      VibrateBox(),
                      SizedBox(height: 50),
                      SoundBox(),
                      SizedBox(height: 50),
                      LogoutButton(),
                    ]
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