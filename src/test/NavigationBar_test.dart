import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Screen/NavigationBar.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyScreen.dart';
import 'package:projeto/Screen/Shop/ShopScreen.dart';
import 'package:projeto/Screen/Timer/TimerScreen.dart';


void main() {
  test('pagechooser method returns correct widget for given index', () {
    NavigatorBarState navigatorBarState = NavigatorBarState();
    expect(navigatorBarState.pagechooser(0), isInstanceOf<TimerScreen>());
    expect(navigatorBarState.pagechooser(1), isInstanceOf<PlacesToStudyScreen>());
    expect(navigatorBarState.pagechooser(2), isInstanceOf<ShopScreen>());
    expect(navigatorBarState.pagechooser(3), isInstanceOf<TimerScreen>());
    expect(navigatorBarState.pagechooser(4), isInstanceOf<TimerScreen>());
    expect(navigatorBarState.pagechooser(5), isInstanceOf<TimerScreen>());
  });

}
