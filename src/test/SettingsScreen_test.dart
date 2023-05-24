import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Screen/Settings/SettingsScreen.dart';

void main() {
  testWidgets('Settings screen test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: SettingsScreen(),
      ),
    );

    expect(find.byKey(Key("StockButton")), findsOneWidget);
    expect(find.byKey(Key("VibrateBox")), findsOneWidget);
    expect(find.byKey(Key("LogoutButton")), findsOneWidget);
  });
}