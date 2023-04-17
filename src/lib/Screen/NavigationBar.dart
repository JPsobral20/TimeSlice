import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projeto/Screen/MenuScreen.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyScreen.dart';
import 'package:projeto/Screen/Shop/ShopScreen.dart';
import 'package:projeto/Screen/TimerScreen.dart';

class NavigatorBar extends StatefulWidget {
  @override
  NavigatorBarState createState() => NavigatorBarState();
}

class NavigatorBarState extends State<NavigatorBar> {
  int pageIndex = 0;
  //final TimerScreen _timerScreen = TimerScreen();
  //final MenuScreen _menuScreen = new MenuScreen();
  Widget showpage = new TimerScreen();

  Widget pagechooser(int page){
    switch(page){
      case 0:
        return TimerScreen();

      case 1:
        return PlacesToStudyScreen();

      case 2:
        return ShopScreen();

      case 3:
        return MenuScreen();

      case 4:
        return TimerScreen();

      default:
        return MenuScreen();
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffffc58d),
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        backgroundColor: Color(0xffffc58d),
        color: Color(0xff51a8ff),
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.timer, color: Colors.black),
          Icon(Icons.book_rounded, color: Colors.black),
          Icon(Icons.shop, color: Colors.black),
          Icon(Icons.track_changes, color: Colors.black),
          Icon(Icons.settings, color: Colors.black),
        ],
          onTap:(int tappedIndex){
            setState(() {
              showpage = pagechooser(tappedIndex);
            });
          }
      ),
      body: Container(
        child: Center(
          child: showpage,
        ),
      ),
    );
  }
}