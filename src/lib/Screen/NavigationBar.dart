import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projeto/Screen/MenuScreen.dart';
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
  Widget _showpage = new TimerScreen();

  Widget _pagechooser(int page){
    switch(page){
      case 0:
      case 4:
        return TimerScreen();
        break;
      case 2:
        return ShopScreen();
        break;
      case 1:
      case 3:
        return MenuScreen();
        break;
      default:
        return MenuScreen();
        break;
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
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
              _showpage = _pagechooser(tappedIndex);
            });
          }
      ),
      body: Container(
        child: Center(
          child: _showpage,
        ),
      ),
    );
  }
}