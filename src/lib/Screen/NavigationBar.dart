import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyScreen.dart';
import 'package:projeto/Screen/Shop/ShopScreen.dart';
import 'package:projeto/Screen/Timer/TimerScreen.dart';
import 'package:projeto/Screen/Settings/SettingsScreen.dart';
import 'package:projeto/Screen/scholarship/ScholarshipScreen.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  NavigatorBarState createState() => NavigatorBarState();
}

class NavigatorBarState extends State<NavigatorBar> {
  int pageIndex = 0;
  int index = 0;
  Widget showPage = new TimerScreen();

  Widget pageChooser(int page){
    switch(page){
      case 0:
        index = 0;
        return TimerScreen();

      case 1:
        index = 1;
        return PlacesToStudyScreen();

      case 2:
        index = 2;
        return ShopScreen();

      case 3:
        index = 3;
        return ScholarshipScreen();

      case 4:
        index = 4;
        return SettingsScreen();

      default:
        index = 0;
        return TimerScreen();
    }
  }


  @override
  Widget build(BuildContext context){
    Color backgroundColor = Color(0xfff3e5f5);

    if (index == 0) {
      backgroundColor = Colors.white;
    }
    else {
      backgroundColor = Color(0xfff3e5f5);
    }

    return Scaffold(
      key: Key("NavigationBar"),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff3e5f5),
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        backgroundColor: backgroundColor,
        color: Color(0xff1565c0),
        animationDuration: Duration(milliseconds: 250),
        items: [
          Icon(Icons.timer, color: Colors.white),
          Icon(Icons.book_rounded, color: Colors.white),
          Icon(Icons.shop, color: Colors.white),
          Icon(Icons.track_changes, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
        ],
        onTap:(int tappedIndex){
          setState(() {
            showPage = pageChooser(tappedIndex);
          });
        }
      ),
      body: Container(
        child: Center(
          child: showPage,
        ),
       ),
    );
  }
}