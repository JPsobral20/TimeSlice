import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Screen/NavigationBar.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyScreen.dart';
import 'package:projeto/Screen/Shop/ShopScreen.dart';
import 'package:projeto/Screen/Timer/TimerScreen.dart';


void main() {
  test('pagechooser method returns correct widget for given index', () {
    NavigatorBarState navigatorBarState = NavigatorBarState();
    expect(navigatorBarState.pageChooser(0), isInstanceOf<TimerScreen>());
    expect(navigatorBarState.pageChooser(1), isInstanceOf<PlacesToStudyScreen>());
    expect(navigatorBarState.pageChooser(2), isInstanceOf<ShopScreen>());
    expect(navigatorBarState.pageChooser(3), isInstanceOf<TimerScreen>());
    expect(navigatorBarState.pageChooser(4), isInstanceOf<TimerScreen>());
    expect(navigatorBarState.pageChooser(5), isInstanceOf<TimerScreen>());
  });

}
